//
//  BUEstimateRequestsTableViewController.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/13.
//

import UIKit

final class BUEstimateRequestsTableViewController: UITableViewController {

    override func viewDidLoad() {
        super.viewDidLoad()
    }

}

extension BUEstimateRequestsTableViewController {
    
    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "estimateRequestCell", for: indexPath)
        
        if let cell = cell as? EstimateRequestTableViewCell {
            cell.update(
                deadline: "2022년 05월 22일",
                department: "China",
                destination: "South Korea",
                itemName: "맥북 프로 14"
            )
        }
        
        return cell
    }

}
