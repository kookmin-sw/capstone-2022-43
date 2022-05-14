//
//  BURegisterDeliveryDateViewController.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/14.
//

import UIKit

final class BURegisterDeliveryDateViewController: UIViewController {
    
    private var estimateRequest = EstimateRequest()

    override func viewDidLoad() {
        super.viewDidLoad()
        
        print(estimateRequest)
    }
    
    func passData(estimateRequest: EstimateRequest) {
        self.estimateRequest = estimateRequest
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
