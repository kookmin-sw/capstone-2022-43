//
//  BVEstimatesTableViewCell.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/09.
//

import UIKit

class BVEstimatesTableViewCell: UITableViewCell {
    
    @IBOutlet weak var idLabel: UILabel!
    @IBOutlet weak var createdAt: UILabel!
    @IBOutlet weak var quoteId: UILabel!
    @IBOutlet weak var hscode: UILabel!
    @IBOutlet weak var country: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
}
