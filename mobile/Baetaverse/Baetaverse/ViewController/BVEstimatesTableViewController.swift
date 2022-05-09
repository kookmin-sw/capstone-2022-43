//
//  BVEstimatesTableViewController.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/09.
//

import UIKit


class BVEstimatesTableViewController: UITableViewController {
    
    private var appService: AppService? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        return appDelegate.appService
    }
    
    private var datass: [Estimate] = []
    
    private func registerXib() {

        let nibName = UINib(nibName: "BVEstimatesTableViewCell", bundle: nil)

        tableView.register(nibName, forCellReuseIdentifier: "temporaryCell")

    }

    override func viewDidLoad() {
        super.viewDidLoad()
        registerXib()
        fetch()
    }
    
    func fetch() {
        Task {
//            let data = try await appService?.fetchEvaluates() ?? []
//            self.datass = datab
            updateUI()
        }
    }
    
    @MainActor
    func updateUI() {
        self.tableView.reloadData()
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 5
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "temporaryCell", for: indexPath)
        
        if let cell = cell as? BVEstimatesTableViewCell {
            cell.idLabel.text = datass[indexPath.row].id
            cell.createdAt.text = datass[indexPath.row].createdAt
            cell.quoteId.text = datass[indexPath.row].quoteId
            cell.hscode.text = datass[indexPath.row].hsCode
            cell.country.text = datass[indexPath.row].country
        }
        
        return cell
    }

}
