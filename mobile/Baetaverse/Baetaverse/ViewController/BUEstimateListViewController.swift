//
//  BUEstimateListViewController.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/03/13.
//

import UIKit

final class BUEstimateListViewController: UIViewController {
    
    @IBOutlet private weak var tradeTypeLabel: UILabel!
    @IBOutlet private weak var tradeDetailLabel: UILabel!
    @IBOutlet private weak var departureDateLabel: UILabel!
    @IBOutlet private weak var departureCountryLabel: UILabel!
    @IBOutlet private weak var destinationCountryLabel: UILabel!
    @IBOutlet private weak var incotermsLabel: UILabel!
    @IBOutlet private weak var dueDateLabel: UILabel!
    
    private let viewModel = BUEstimateListViewModel()
    private var id: Int?
    
    static var estimateRecordCount = 10
    
    @IBOutlet weak var tableView: UITableView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDelegate()
        fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        tableView.reloadData()
    }
    
    func passData(id: Int?) {
        self.id = id
    }
    
    private func fetchData() {
        Task {
            do {
                let result = try await viewModel.queryEstimateRequestDetail(id: id)
                updateUI(with: result)
            } catch {
                displayError(
                    error,
                    title: "견적 정보를 불러올 수 없습니다"
                )
            }
        }
    }
    
    private func updateUI(with estimateReqeust: EstimateRequest) {
        tradeTypeLabel.text = estimateReqeust.tradeType
        tradeDetailLabel.text = estimateReqeust.tradeDetail
        departureDateLabel.text = estimateReqeust.forwardingDate.formatted()
        departureCountryLabel.text = estimateReqeust.departureCountry
        destinationCountryLabel.text = estimateReqeust.destinationCountry
        incotermsLabel.text = estimateReqeust.incoterms
        dueDateLabel.text = estimateReqeust.closingDate.formatted()
    }
    
    @IBAction func unwindToBUEstimateListView(_ segue: UIStoryboardSegue) { }

}

extension BUEstimateListViewController {
    
    private func configureDelegate() {
        tableView.dataSource = self
        tableView.delegate = self
    }
    
}

extension BUEstimateListViewController: UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return Self.estimateRecordCount
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "estimatesummarycell")!
        return cell
    }
    
}

extension BUEstimateListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        print("Hello World")
        performSegue(withIdentifier: "showEstimateDetail", sender: nil)
    }
    
}
