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

}

extension BUReviewTargetTableViewController {
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        let quotation = dataSource.snapshot().itemIdentifiers[indexPath.row]
        
        let alert = UIAlertController(
            title: "리뷰 등록하기",
            message: "리뷰 내용을 작성해주세요!",
            preferredStyle: .alert
        )
        alert.addTextField { textField in
            textField.placeholder = "점수를 입력해주세요 (최대 5점)"
        }
        alert.addTextField { textField in
            textField.placeholder = "리뷰 내용을 입력해주세요!"
        }
        
        alert.addAction(UIAlertAction(title: "취소", style: .cancel))
        alert.addAction(UIAlertAction(title: "확인", style: .default, handler: { _ in
            Task {
                try? await self.viewModel.registerReview(
                    with: quotation,
                    score: (alert.textFields?[0].text) ?? "",
                    message: (alert.textFields?[1].text) ?? ""
                )
            }
        }))
        
        present(alert, animated: true)
    }
    
}
