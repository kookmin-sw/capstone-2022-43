//
//  BusinessService.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/09.
//

import Foundation

protocol BusinessService {
    
    func registerEstimate(estimate: Estimate) async throws
    func registerEvaluateRequest(estimateRequest: EstimateRequest, products: [Product]) async throws
    func registerReview(quotationId: Int, requestId: Int, score: Int, message: String) async throws
    func queryEstimateRequestDetail(id: String) async throws -> (EstimateRequest, [Product])
    func queryHSCode(code: String) async throws -> [String]
    func queryEstimateRequests() async throws -> [EstimateRequest]
    func queryEstimates() async throws -> [QuotationEntity]
    func queryAllEstimatesRequest() async throws -> [EstimateRequest]
    func queryReviews() async throws -> [ReviewEntity]
    func queryEstimatesWithEstimateRequest(estimateRequestId: String) async throws -> [QuotationEntity]
    
}
