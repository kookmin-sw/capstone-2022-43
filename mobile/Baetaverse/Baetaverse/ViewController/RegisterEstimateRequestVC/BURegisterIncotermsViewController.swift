//
//  BURegisterIncotermsViewController.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/15.
//

import UIKit

class BURegisterIncotermsViewController: UIViewController {

    @IBOutlet private weak var incotermsTextField: UITextField!
    @IBOutlet private weak var nextButton: UIButton!
    
    private var estimateRequest = EstimateRequest()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        incotermsTextField.delegate = self
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
                toItem: nextButton,
                attribute: .bottom,
                multiplier: 1,
                constant: 20
            )
        ])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let productVC = segue.destination as? BURegisterProductViewController {
            productVC.passData(estimateRequest: estimateRequest)
        }
    }

}

extension BURegisterIncotermsViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.estimateRequest.incoterms = textField.text ?? ""
        print(self.estimateRequest)
    }
    
}

extension BURegisterIncotermsViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
