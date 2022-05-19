//
//  BURegisterDestinationViewController.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/15.
//

import UIKit

final class BURegisterDestinationViewController: UIViewController {
    
    @IBOutlet private weak var destinationDetailTextField: UITextField!
    @IBOutlet private weak var countrySelectButton: UIButton!
    @IBOutlet private weak var nextButton: UIButton!
    
    private var estimateRequest = EstimateRequest()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        destinationDetailTextField.delegate = self
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
        if let navVC = segue.destination as? UINavigationController,
           let rootVC = navVC.topViewController as? BUSelectRegionTableViewController {
            rootVC.selectRegionDelegate = self
        }
        
        if let incotermsVC = segue.destination as? BURegisterIncotermsViewController {
            estimateRequest.destinationDetail = destinationDetailTextField.text ?? ""
            incotermsVC.passData(estimateRequest: estimateRequest)
        }
    }

}

extension BURegisterDestinationViewController: UITextFieldDelegate {
    
    func textFieldDidEndEditing(_ textField: UITextField) {
        self.estimateRequest.destinationDetail = textField.text ?? ""
    }
    
}

extension BURegisterDestinationViewController: SelectRegionDelegate {
    
    func send(region: String) {
        self.estimateRequest.destinationCountry = region
        self.countrySelectButton.setTitle(
            Locale.current.localizedString(forRegionCode: region),
            for: .normal
        )
    }
    
}

extension BURegisterDestinationViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
