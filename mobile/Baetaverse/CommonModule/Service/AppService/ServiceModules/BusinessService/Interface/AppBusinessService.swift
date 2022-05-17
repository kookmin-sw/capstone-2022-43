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
    func queryHSCode(token: String, code: String) async throws -> [String]
    func queryEstimateRequests(token: String) async throws -> [EstimateRequest]
    func queryEstimateRequestDetail(token: String, id: String) async throws -> (EstimateRequest, [Product])
    func queryEstimates(token: String) async throws -> (estimate: Estimate, forwarder: UserProfile,
                                                        estimateRequest: EstimateRequest, products: [Product])
    func queryAllEstimatesRequest(token: String) async throws -> [EstimateRequest]
    
}
