//
//  BURegisterDepartureViewController.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/03/13.
//

import UIKit

final class BURegisterDepartureViewController: UIViewController {
    
    @IBOutlet private weak var departureDetailAddressTextField: UITextField!
    @IBOutlet private weak var formStackView: UIStackView!
    
    private var estimateRequest = EstimateRequest()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        departureDetailAddressTextField.delegate = self
        configureUILayout()
    }
        
    func passData(estimateRequest: EstimateRequest) {
        self.estimateRequest = estimateRequest
    }
    
    private func configureUILayout() {
        NSLayoutConstraint.activate([
            NSLayoutConstraint(
                item: view.keyboardLayoutGuide,
                attribute: .top,
                relatedBy: .equal,
                toItem: formStackView,
                attribute: .bottom,
                multiplier: 1,
                constant: 200
            )
        ])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navVC = segue.destination as? UINavigationController,
           let rootVC = navVC.topViewController as? BUSelectRegionTableViewController {
            rootVC.selectRegionDelegate = self
        }
        
        if let registerDestVC = segue.destination as? BURegisterDestinationViewController {
            registerDestVC.passData(estimateRequest: estimateRequest)
        }
    }
    
}

extension BURegisterDepartureViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.estimateRequest.departureDetail = textField.text ?? ""
    }
    
}

extension BURegisterDepartureViewController: SelectRegionDelegate {
    
    func send(region: String) {
        self.estimateRequest.departureCountry = region
    }
    
}

extension BURegisterDepartureViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
