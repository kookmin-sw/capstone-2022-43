//
//  AppBusinessService.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/04/01.
//

import Foundation

protocol AppBusinessService {
    
    func registerEvaluate(token: String, estimateRequest: EstimateRequest, products: [Product]) async throws
    func queryHSCode(token: String, code: String) async throws -> [String]
    func queryEstimateRequests(token: String) async throws -> [EstimateRequest]
    
}
