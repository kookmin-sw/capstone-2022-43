//
//  EstimateRequestsTableViewModel.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/13.
//

import Foundation
import UIKit.UIApplication

final class EstimateRequestsTableViewModel {
    
    private var appService: AppService? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        return appDelegate.appService
    }
    
    private(set) var estimateRequests: [EstimateRequest] = []
    
    func fetchEstimateRequests() async throws {
        let result = try await appService?.queryEstimateRequests()
        if let result = result {
            self.estimateRequests = result
        }
    }
    
}
