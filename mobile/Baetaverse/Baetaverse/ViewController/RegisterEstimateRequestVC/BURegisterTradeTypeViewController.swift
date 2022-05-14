//
//  BURegisterEstimateRequestTradeTypeFormViewController.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/14.
//

import UIKit

final class BURegisterTradeTypeViewController: UIViewController {
    
    @IBOutlet private weak var tradeTypeSegmentedControl: UISegmentedControl!
    @IBOutlet private weak var tradeDetailSegmentedControl: UISegmentedControl!
        
    private var estimateRequest = EstimateRequest()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        updateData()
    }
    
    @IBAction private func tradeTypeValueChanged(_ sender: UISegmentedControl) {
        updateTradeTypeValue(with: sender)
    }
    
    @IBAction private func tradeTypeDetail(_ sender: UISegmentedControl) {
        updateTradeDetailValue(with: sender)
    }
    
    private func updateData() {
        updateTradeTypeValue(with: tradeTypeSegmentedControl)
        updateTradeDetailValue(with: tradeDetailSegmentedControl)
    }
    
    private func updateTradeTypeValue(with segmentedControl: UISegmentedControl) {
        let selectedValue = segmentedControl.selectedSegmentIndex
        
        if selectedValue == 0 {
            estimateRequest.tradeType = "수출"
        } else if selectedValue == 1 {
            estimateRequest.tradeType = "수입"
        }
    }
    
    private func updateTradeDetailValue(with segmentedControl: UISegmentedControl) {
        let selectedValue = segmentedControl.selectedSegmentIndex
        
        if selectedValue == 0 {
            estimateRequest.tradeDetail = "Door to Door"
        } else if selectedValue == 1 {
            estimateRequest.tradeDetail = "Port to Port"
        }
    }
    
    // MARK: - Navigation
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let deliveryDateVC = segue.destination as? BURegisterDeliveryDateViewController {
            deliveryDateVC.passData(estimateRequest: estimateRequest)
        }
    }

}
