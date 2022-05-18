//
//  ReviewTargetViewModel.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/19.
//

import Foundation
import UIKit.UIApplication

final class ReviewTargetViewModel {
    
    private var appService: AppService? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        return appDelegate.appService
    }
    
    func fetchEstimates() async throws -> [QuotationEntity] {
        var quotations: [QuotationEntity] = []
        
        let myEstimateRequests = try await appService?.queryEstimateRequests() ?? []
        let ids = myEstimateRequests
            .filter { $0.closingDate > Date() }
            .compactMap { $0.id }
        
        for id in ids {
            let stringId = String(id)
            let result = try await appService?.queryEstimatesWithEstimateRequest(
                estimateRequestId: stringId
            )
            quotations += result ?? []
        }
        
        return quotations
    }
    
}
