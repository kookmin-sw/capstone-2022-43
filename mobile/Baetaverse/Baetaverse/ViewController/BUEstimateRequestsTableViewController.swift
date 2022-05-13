//
//  BUEstimateRequestsTableViewController.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/13.
//

import UIKit

final class BUEstimateRequestsTableViewController: UITableViewController {

    private let viewModel = EstimateRequestsTableViewModel()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
    }
    
    private func loadData() {
        Task {
            do {
                try await viewModel.fetchEstimateRequests()
                updateUI()
            } catch {
                displayError(
                    error,
                    title: "견적서 명단 조회에 실패하였습니다"
                )
            }
        }
    }
    
    func updateUI() {
        self.tableView.reloadData()
    }
    
    func displayError(_ error: Error, title: String) {
        guard let _ = viewIfLoaded?.window else { return }
        
        let alert = UIAlertController(
            title: title,
            message: error.localizedDescription,
            preferredStyle: .alert
        )
        alert.addAction(UIAlertAction(
            title: "확인",
            style: .default
        ))
        
        present(alert, animated: true)
    }

}

extension BUEstimateRequestsTableViewController {
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return viewModel.estimateRequests.count
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "estimateRequestCell", for: indexPath)
        
        let estimateRequests = viewModel.estimateRequests
        let estimateRequest = estimateRequests[indexPath.row]
        
        if let cell = cell as? EstimateRequestTableViewCell {
            cell.update(
                deadline: estimateRequest.closingDate.formatted(),
                department: estimateRequest.departureCountry,
                destination: estimateRequest.destinationCountry,
                typeName: estimateRequest.tradeType
            )
        }
        
        return cell
    }

}
