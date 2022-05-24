//
//  BUEstimateRequestsTableViewController.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/13.
//

import UIKit

final class BUEstimateRequestsTableViewController: UITableViewController {

    private let viewModel = EstimateRequestsTableViewModel()
    
    private var selectedId: Int?
    
    override func viewDidLoad() {
        super.viewDidLoad()
        loadData()
        configureRefreshControl()
        
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
            refreshControl?.endRefreshing()
        }
    }
    
    private func updateUI() {
        self.tableView.reloadData()
    }
    
    private func configureRefreshControl() {
        refreshControl = UIRefreshControl()
        refreshControl?.addTarget(
            self,
            action: #selector(handleRefreshControl),
            for: .valueChanged
        )
    }
    
    @objc private func handleRefreshControl() {
        loadData()
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let vc = segue.destination as? BUEstimateListViewController {
            vc.passData(id: selectedId)
        }
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
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        self.selectedId = viewModel.estimateRequests[indexPath.row].id
        performSegue(
            withIdentifier: "estimateDetailSegue",
            sender: nil
        )
    }

}
