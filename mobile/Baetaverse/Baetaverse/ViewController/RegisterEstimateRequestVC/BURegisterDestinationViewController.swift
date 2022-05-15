//
//  BURegisterDestinationViewController.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/15.
//

import UIKit

final class BURegisterDestinationViewController: UIViewController {
    
    @IBOutlet private weak var destinationDetailTextField: UITextField!
    
    private var estimateRequest = EstimateRequest()

    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
        destinationDetailTextField.delegate = self
    }
    
    func passData(estimateRequest: EstimateRequest) {
        self.estimateRequest = estimateRequest
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if let navVC = segue.destination as? UINavigationController,
           let rootVC = navVC.topViewController as? BUSelectRegionTableViewController {
            rootVC.selectRegionDelegate = self
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
    }
    
}

extension BURegisterDestinationViewController {
    
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        self.view.endEditing(true)
    }
    
}
