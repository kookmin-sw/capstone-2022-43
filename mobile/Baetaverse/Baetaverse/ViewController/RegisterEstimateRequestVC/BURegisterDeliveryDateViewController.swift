//
//  BURegisterDeliveryDateViewController.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/14.
//

import UIKit

final class BURegisterDeliveryDateViewController: UIViewController {
    
    @IBOutlet private weak var diliveryDatePicker: UIDatePicker!
    
    private var estimateRequest = EstimateRequest()

    override func viewDidLoad() {
        super.viewDidLoad()
        updateDiliveryDate(with: diliveryDatePicker)
    }
    
    @IBAction func diliveryDateValueChanged(_ sender: UIDatePicker) {
        updateDiliveryDate(with: sender)
    }
    
    func passData(estimateRequest: EstimateRequest) {
        self.estimateRequest = estimateRequest
    }
    
    private func updateDiliveryDate(with datePicker: UIDatePicker) {
        let date = datePicker.date
        estimateRequest.forwardingDate = date
    }
    
    // MARK: - Navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let departureVC = segue.destination as? BURegisterDepartureViewController {
            departureVC.passData(estimateRequest: estimateRequest)
        }
    }

}
