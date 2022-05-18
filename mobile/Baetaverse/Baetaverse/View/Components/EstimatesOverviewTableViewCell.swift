//
//  EstimatesOverviewTableViewCell.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/18.
//

import UIKit

final class EstimatesOverviewTableViewCell: UITableViewCell {

    @IBOutlet private weak var corporationLabel: UILabel!
    @IBOutlet private weak var expectedTimeLabel: UILabel!
    @IBOutlet private weak var totalCostLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        self.corporationLabel.text = ""
        self.expectedTimeLabel.text = ""
        self.totalCostLabel.text = ""
    }
    
    func configureContent(name: String, time: Int, cost: Int) {
        self.corporationLabel.text = name
        self.expectedTimeLabel.text = "\(time) 시간"
        self.totalCostLabel.text = String(cost)
    }

}
