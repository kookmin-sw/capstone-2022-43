//
//  BUSelectRegionTableViewController.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/14.
//

import UIKit

final class BUSelectRegionTableViewController: UITableViewController {
    
    weak var selectRegionDelegate: SelectRegionDelegate?
    private var selectedRegion: String?
    
    private lazy var dataSource: UITableViewDiffableDataSource<String, String> = {
        UITableViewDiffableDataSource(tableView: tableView) { tableView, indexPath, item in
            let cell = tableView.dequeueReusableCell(withIdentifier: "countryCell", for: indexPath)
            let countryName = Locale.current.localizedString(forRegionCode: item) ?? ""
            
            var content = cell.defaultContentConfiguration()
            content.text = countryName
            cell.contentConfiguration = content
            
            if let selectedRegion = self.selectedRegion, item == selectedRegion {
                cell.accessoryType = .checkmark
            }
            
            return cell
        }
    }()
    
    private func filteredItems(with searchString: String) -> [String] {
        if searchString.isEmpty { return Locale.isoRegionCodes }
        return Locale.isoRegionCodes.filter {
            let countryName = Locale.current.localizedString(forRegionCode: $0) ?? ""
            return countryName.localizedCaseInsensitiveContains(searchString)
        }
    }
    
    private var snapshot: NSDiffableDataSourceSnapshot<String, String> {
        var snapshot = NSDiffableDataSourceSnapshot<String, String>()
        snapshot.appendSections(["main"])
        snapshot.appendItems(filteredItems(with: ""))
        return snapshot
    }
    
    private let searchController: UISearchController = {
        let controller = UISearchController()
        controller.hidesNavigationBarDuringPresentation = false
        controller.automaticallyShowsCancelButton = false
        return controller
    }()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        configureUIComponents()
        updateUI()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        sendRegionData()
    }
    
    private func sendRegionData() {
        if let code = selectedRegion {
            selectRegionDelegate?.send(region: code)
        }
    }
    
}

extension BUSelectRegionTableViewController {
    
    // MARK: - UIConfiguration
    
    private func configureUIComponents() {
        configureTableView()
        configureSearchController()
        configureSearchBar()
    }
    
    private func configureTableView() {
        tableView.dataSource = dataSource
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
    
    private func updateUI() {
        self.dataSource.apply(snapshot)
    }
    
}

extension BUSelectRegionTableViewController {

    // MARK: - TableViewDelegate

    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        tableView.deselectRow(at: indexPath, animated: false)
        
        let code = dataSource.snapshot().itemIdentifiers[indexPath.row]
        guard let cell = tableView.cellForRow(at: indexPath) else { return }
        
        if let selectedRegion = selectedRegion, selectedRegion != code {
            cell.accessoryType = .none
        }
        
        selectedRegion = code
        cell.accessoryType = .checkmark
    }

}

extension BUSelectRegionTableViewController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        dismiss(animated: true)
    }
    
}

extension BUSelectRegionTableViewController: UISearchResultsUpdating {
    
    func updateSearchResults(for searchController: UISearchController) {
        let searchString = searchController.searchBar.text ?? ""
        var snapshot = NSDiffableDataSourceSnapshot<String, String>()
        snapshot.appendSections(["main"])
        snapshot.appendItems(filteredItems(with: searchString))
        self.dataSource.apply(snapshot)
    }
    
}
