//
//  BURegisterDueDateViewController.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/03/13.
//

import UIKit

final class BURegisterDueDateViewController: UIViewController {
    
    private let viewModel = RegisterEstimateRequestViewModel()
    
    private var estimateRequest = EstimateRequest()
    private var product = Product()
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }
    
    @IBAction private func dueDateValueChanged(_ sender: UIDatePicker) {
        self.estimateRequest.closingDate = sender.date
    }
    
    @IBAction private func acceptButtonClicked(_ sender: UIButton) {
        Task {
            do {
                try await viewModel.register(
                    estimateRequest: estimateRequest,
                    with: product
                )
                performSegue(
                    withIdentifier: "unwindToBUMainSegue",
                    sender: nil
                )
            } catch {
                displayError(
                    error,
                    title: "견적요청서 등록에 실패하였습니다"
                )
            }
        }
    }
    
    func passData(estimateRequest: EstimateRequest, product: Product) {
        self.estimateRequest = estimateRequest
        self.product = product
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
