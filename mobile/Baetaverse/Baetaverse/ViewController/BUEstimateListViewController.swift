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
    @IBOutlet private weak var tableView: UITableView!
    
    private let viewModel = BUEstimateListViewModel()
    
    private var id: Int?
    private var selectedId: Int?
        
    private lazy var dataSource: UITableViewDiffableDataSource<String, QuotationEntity> = {
        UITableViewDiffableDataSource(tableView: self.tableView) { tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: "estimatesummarycell")
            
            if let cell = cell as? EstimatesOverviewTableViewCell {
                cell.configureContent(
                    name: item.forwarder.corporationName,
                    time: item.estimate.estimatedTime,
                    cost: item.estimate.totalPrice
                )
            }
            
            return cell
        }
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureDelegate()
        fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        fetchData()
    }
    
    func passData(id: Int?) {
        self.id = id
    }
    
    private func fetchData() {
        Task {
            do {
                let estimatesRequestInfo = try await viewModel.queryEstimateRequestDetail(id: id)
                let estimates = try await viewModel.queryEstimates(with: id)
                updateUI(with: estimatesRequestInfo)
                updateUI(with: estimates)
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
    
    private func updateUI(with estimates: [QuotationEntity]) {
        var snapshot = NSDiffableDataSourceSnapshot<String, QuotationEntity>()
        snapshot.appendSections(["main"])
        snapshot.appendItems(estimates)
        dataSource.apply(snapshot)
    }
    
    @IBAction func unwindToBUEstimateListView(_ segue: UIStoryboardSegue) { }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let estimateDetailVC = segue.destination as? BUEstimateDetailViewController {
            estimateDetailVC.passData(id: selectedId)
        }
    }

}

extension BUEstimateListViewController {
    
    private func configureDelegate() {
        tableView.dataSource = self.dataSource
        tableView.delegate = self
    }
    
}

extension BUEstimateListViewController: UITableViewDelegate {
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        let estimate = dataSource.snapshot().itemIdentifiers[indexPath.row]
        self.selectedId = estimate.id
        performSegue(withIdentifier: "showEstimateDetail", sender: nil)
    }
    
}
