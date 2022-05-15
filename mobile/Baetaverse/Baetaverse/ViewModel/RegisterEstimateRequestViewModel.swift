//
//  RegisterEstimateRequestViewModel.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/15.
//

import Foundation
import UIKit.UIApplication

final class RegisterEstimateRequestViewModel {
    
    private var appService: AppService? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        return appDelegate.appService
    }
    
    func register(estimateRequest: EstimateRequest, with product: Product) async throws {
        try await appService?.registerEvaluate(estimateRequest: estimateRequest, products: [product])
    }
    
}
