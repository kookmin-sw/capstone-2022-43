//
//  BUEstimateListViewModel.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/16.
//

import Foundation
import UIKit.UIApplication

final class BUEstimateListViewModel {
    
    private var appService: AppService? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        return appDelegate.appService
    }
    
    func queryEstimateRequestDetail(id: Int?) async throws -> (EstimateRequest, Product) {
        guard let id = id else { return (EstimateRequest(), Product()) }
        guard let (estimatesRequst, products) = try await appService?.queryEstimateRequestDetail(id: String(id)) else {
            return (EstimateRequest(), Product())
        }
        guard let product = products.first else { return (EstimateRequest(), Product()) }
        return (estimatesRequst, product)
    }
    
    func queryEstimates(with estimateRequestId: Int?) async throws -> [QuotationEntity] {
        guard let estimateRequestId = estimateRequestId else { return [] }
        let result = try await appService?.queryEstimatesWithEstimateRequest(
            estimateRequestId: String(estimateRequestId)
        )
        return result ?? []
    }
    
}
