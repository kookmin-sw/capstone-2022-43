//
//  AppBusinessService.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/04/01.
//

import Foundation

protocol AppBusinessService {
    
    func registerEstimate(token: String, estimate: Estimate) async throws
    func registerEvaluateRequest(token: String, estimateRequest: EstimateRequest, products: [Product]) async throws
    func registerReview(token: String, quotationId: Int, requestId: Int, score: Int, message: String) async throws
    func queryHSCode(token: String, code: String) async throws -> [String]
    func queryEstimateRequests(token: String) async throws -> [EstimateRequest]
    func queryEstimateRequestDetail(token: String, id: String) async throws -> (EstimateRequest, [Product])
    func queryEstimates(token: String) async throws -> [QuotationEntity]
    func queryAllEstimatesRequest(token: String) async throws -> [EstimateRequest]
    func queryReviews(token: String) async throws -> [ReviewEntity]
    func queryEstimatesWithEstimateRequest(token: String, estimateRequestId: String) async throws -> [QuotationEntity]
    
}
