//
//  BUSelectRegionTableViewController.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/14.
//

import UIKit

final class BUSelectRegionTableViewController: UITableViewController {
    
    private let dataSource = BUSelectRegionDataSource()
    
    weak var selectRegionDelegate: SelectRegionDelegate?
    
    private let searchController: UISearchController = {
        let controller = UISearchController(searchResultsController: nil)
        controller.hidesNavigationBarDuringPresentation = false
        controller.automaticallyShowsCancelButton = false
        return controller
    }()

    override func viewDidLoad() {
        super.viewDidLoad()
        configureUIComponents()
    }
    
    override func viewWillDisappear(_ animated: Bool) {
        super.viewWillDisappear(animated)
        self.selectRegionDelegate?.send(region: dataSource.currentRegion)
    }
    
    private func configureUIComponents() {
        self.tableView.dataSource = dataSource
        navigationItem.hidesSearchBarWhenScrolling = false
        navigationItem.searchController = searchController
        let searchBar = searchController.searchBar
        searchBar.showsCancelButton = true
        searchBar.delegate = self
    }
    
    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */

}

extension BUSelectRegionTableViewController {
    
    // MARK: - TableViewDelegate
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        // Unselect the row.
        tableView.deselectRow(at: indexPath, animated: false)
        
        if let cell = tableView.cellForRow(at: dataSource.selectedRegion) {
            cell.accessoryType = .none
        }
        
        dataSource.changeSelectedRegion(to: indexPath)
        
        // Mark the newly selected filter item with a checkmark.
        if let cell = tableView.cellForRow(at: indexPath) {
            cell.accessoryType = .checkmark
        }
    }
    
}

extension BUSelectRegionTableViewController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("cancleButtonClicked")
    }
    
}

protocol SelectRegionDelegate: AnyObject {
    
    func send(region: String)
    
}
