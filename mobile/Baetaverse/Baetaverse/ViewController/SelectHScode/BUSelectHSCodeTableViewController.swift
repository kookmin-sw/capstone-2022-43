//
//  BUSelectHSCodeTableViewController.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/16.
//

import UIKit

final class BUSelectHSCodeTableViewController: UITableViewController {
    
    weak var selectHSCodeDelegate: SelectHSCodeDelegate?
    
    private let viewModel = SelectHSCodeViewModel()
    
    private var selectedItem = ""
    
    private let searchController: UISearchController = {
        let controller = UISearchController()
        controller.hidesNavigationBarDuringPresentation = false
        controller.automaticallyShowsCancelButton = false
        return controller
    }()
    
    private lazy var dataSource: UITableViewDiffableDataSource<String, String> = {
        UITableViewDiffableDataSource(tableView: tableView) { tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: "hscodeCell", for: indexPath)
            
            var content = cell.defaultContentConfiguration()
            content.text = item
            cell.contentConfiguration = content
            
            if item == self.selectedItem {
                cell.accessoryType = .checkmark
            } else {
                cell.accessoryType = .none
            }
            
            return cell
        }
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUIComponents()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        selectHSCodeDelegate?.send(code: selectedItem)
    }
    
}

extension BUSelectHSCodeTableViewController {
    
    // MARK: - UIConfiguration
    
    private func configureUIComponents() {
        configureSearchController()
        configureSearchBar()
        configureTableView()
    }
    
    private func configureSearchController() {
        navigationItem.searchController = searchController
        searchController.obscuresBackgroundDuringPresentation = false
        searchController.searchResultsUpdater = self
        navigationItem.hidesSearchBarWhenScrolling = false
    }
    
    private func configureSearchBar() {
        let searchBar = searchController.searchBar
        searchBar.showsCancelButton = true
        searchBar.delegate = self
    }
    
    private func configureTableView() {
        tableView.dataSource = self.dataSource
    }
    
}

extension BUSelectHSCodeTableViewController {

    // MARK: - TableViewDelegate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        tableView.visibleCells.forEach { cell in
            cell.accessoryType = .none
        }
        
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .none
        }
        
        let snapshot = dataSource.snapshot()
        selectedItem = snapshot.itemIdentifiers[indexPath.row]
        
        // Mark the newly selected filter item with a checkmark.
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
        }
    }

}

extension BUSelectHSCodeTableViewController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        dismiss(animated: true)
    }
    
}

extension BUSelectHSCodeTableViewController: UISearchResultsUpdating {
    func updateSearchResults(for searchController: UISearchController) {
        
        Task {
            let searchString = searchController.searchBar.text ?? ""
            let result = (try? await viewModel.queryHSCode(with: searchString)) ?? []
            
            var snapshot = NSDiffableDataSourceSnapshot<String, String>()
            
            snapshot.appendSections(["main"])
            snapshot.appendItems(result)
            
            await self.dataSource.apply(snapshot)
        }
    }
    
}
