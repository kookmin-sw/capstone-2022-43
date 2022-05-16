//
//  BusinessService.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/09.
//

import Foundation

protocol BusinessService {
    
    func queryEstimateRequestDetail(id: String) async throws -> (EstimateRequest, [Product])
    func registerEvaluateRequest(estimateRequest: EstimateRequest, products: [Product]) async throws
    func queryHSCode(code: String) async throws -> [String]
    func queryEstimateRequests() async throws -> [EstimateRequest]
    
}
