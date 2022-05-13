//
//  EstimateRequestTableViewCell.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/13.
//

import UIKit

final class EstimateRequestTableViewCell: UITableViewCell {
    
    @IBOutlet private var deadlineLabel: UILabel!
    @IBOutlet private var departmentLabel: UILabel!
    @IBOutlet private var destinationLabel: UILabel!
    @IBOutlet private var typeNameLabel: UILabel!
    
    func update(deadline: String, department: String, destination: String, typeName: String) {
        self.deadlineLabel.text = deadline
        self.departmentLabel.text = department
        self.destinationLabel.text = destination
        self.typeNameLabel.text = typeName
    }

}
