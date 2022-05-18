//
//  BUReviewTargetTableViewController.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/18.
//

import UIKit

@MainActor
final class BUReviewTargetTableViewController: UITableViewController {
    
    private let viewModel = ReviewTargetViewModel()
    
    private lazy var dataSource: UITableViewDiffableDataSource<String, QuotationEntity> = {
        UITableViewDiffableDataSource(tableView: self.tableView) { tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: "estimatesCell", for: indexPath)

            if let cell = cell as? WaitingReviewTableViewCell {
                cell.configureCell(
                    estimate: item
                )
            }

            return cell
        }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        self.tableView.dataSource = self.dataSource
        fetchData()
    }
    
    private func fetchData() {
        Task {
            let result = try? await viewModel.fetchEstimates()
            updateUI(with: result ?? [])
        }
    }
    
    private func updateUI(with quotation: [QuotationEntity]) {
        var snapshot = NSDiffableDataSourceSnapshot<String, QuotationEntity>()
        snapshot.appendSections(["main"])
        snapshot.appendItems(quotation)
        dataSource.apply(snapshot)
    }
    

    /*
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        
    }
    */

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}
