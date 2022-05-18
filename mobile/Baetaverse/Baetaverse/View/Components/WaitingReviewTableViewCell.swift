//
//  WaitingReviewTableViewCell.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/19.
//

import UIKit

final class WaitingReviewTableViewCell: UITableViewCell {

    @IBOutlet private weak var forwarderNameLabel: UILabel!
    @IBOutlet private weak var totalTimeLabel: UILabel!
    @IBOutlet private weak var totalCostLabel: UILabel!
    @IBOutlet private weak var departureCountryLabel: UILabel!
    @IBOutlet private weak var destinationCountryLabel: UILabel!
    
    override func awakeFromNib() {
        super.awakeFromNib()
        // Initialization code
    }

    override func setSelected(_ selected: Bool, animated: Bool) {
        super.setSelected(selected, animated: animated)

        // Configure the view for the selected state
    }
    
    override func prepareForReuse() {
        forwarderNameLabel.text = ""
        totalTimeLabel.text = ""
        totalCostLabel.text = ""
        departureCountryLabel.text = ""
        destinationCountryLabel.text = ""
    }
    
    func configureCell(estimate: QuotationEntity) {
        forwarderNameLabel.text = estimate.forwarder.corporationName
        totalTimeLabel.text = String(estimate.estimate.estimatedTime)
        totalCostLabel.text = String(estimate.estimate.totalPrice)
        departureCountryLabel.text = estimate.estimateRequest.departureCountry
        destinationCountryLabel.text = estimate.estimateRequest.destinationCountry
    }

}
