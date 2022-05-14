//
//  BURegisterEstimateRequestTradeTypeFormViewController.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/14.
//

import UIKit

final class BURegisterTradeTypeViewController: UIViewController {
    
    private var estimateRequest = EstimateRequest()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction func tradeTypeValueChanged(_ sender: UISegmentedControl) {
        let selectedValue = sender.selectedSegmentIndex
        
        if selectedValue == 0 {
            estimateRequest.tradeType = "수출"
        } else if selectedValue == 1 {
            estimateRequest.tradeType = "수입"
        }
    }
    
    @IBAction func tradeTypeDetail(_ sender: UISegmentedControl) {
        let selectedValue = sender.selectedSegmentIndex
        
        if selectedValue == 0 {
            estimateRequest.tradeDetail = "Door to Door"
        } else if selectedValue == 1 {
            estimateRequest.tradeDetail = "Port to Port"
        }
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
