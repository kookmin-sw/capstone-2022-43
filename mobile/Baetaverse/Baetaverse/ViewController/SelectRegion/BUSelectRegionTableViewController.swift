//
//  BUSelectRegionTableViewController.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/14.
//

import UIKit

final class BUSelectRegionTableViewController: UITableViewController {
    
//    private let viewModel = SelectRegionViewModel()
    
    private let dataSource = BUSelectRegionDataSource()
    
    private let searchController: UISearchController = {
        let controller = UISearchController(searchResultsController: nil)
        controller.hidesNavigationBarDuringPresentation = false
        controller.automaticallyShowsCancelButton = false
        return controller
    }()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
        
        configureUIComponents()
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

extension BUSelectRegionTableViewController: UISearchBarDelegate {
    
    func searchBarCancelButtonClicked(_ searchBar: UISearchBar) {
        print("cancleButtonClicked")
    }
    
}
