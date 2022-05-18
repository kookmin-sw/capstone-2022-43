//
//  BURegisterProductViewController.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/15.
//

import UIKit

final class BURegisterProductViewController: UIViewController {
    
    @IBOutlet private weak var productNameTextField: UITextField!
    @IBOutlet private weak var hscodeTextField: UITextField!
    @IBOutlet private weak var totalPriceTextField: UITextField!
    @IBOutlet private weak var volumeTextField: UITextField!
    @IBOutlet private weak var unitTextField: UITextField!
    @IBOutlet private weak var packagingMethodTextField: UITextField!
    @IBOutlet private weak var horizontalTextField: UITextField!
    @IBOutlet private weak var verticalTextField: UITextField!
    @IBOutlet private weak var heightTextField: UITextField!
    @IBOutlet private weak var lengthUnit: UITextField!
    @IBOutlet private weak var productCountTextField: UITextField!
    
    private var estimateRequest = EstimateRequest()
    private var product = Product()
    
    override func viewDidLoad() {
        productNameTextField.delegate = self
        hscodeTextField.delegate = self
        totalPriceTextField.delegate = self
        volumeTextField.delegate = self
        unitTextField.delegate = self
        packagingMethodTextField.delegate = self
        horizontalTextField.delegate = self
        verticalTextField.delegate = self
        heightTextField.delegate = self
        lengthUnit.delegate = self
        productCountTextField.delegate = self
    }
    
    func passData(estimateRequest: EstimateRequest) {
        self.estimateRequest = estimateRequest
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let dueDateVC = segue.destination as? BURegisterDueDateViewController {
            dueDateVC.passData(
                estimateRequest: estimateRequest,
                product: product
            )
        }
    }
    
}

extension BURegisterProductViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField, reason: UITextField.DidEndEditingReason) {
        let text = textField.text ?? ""
        if textField == productNameTextField {
            product.name = text
        } else if textField == hscodeTextField {
            product.hsCode = text
        } else if textField == totalPriceTextField {
            product.price = Int(text) ?? 0
        } else if textField == volumeTextField {
            product.weight = Int(text) ?? 0
        } else if textField == unitTextField {
            product.standardUnit = text
        }
    }
    
}

extension BURegisterProductViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
