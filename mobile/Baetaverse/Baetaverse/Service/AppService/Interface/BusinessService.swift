//
//  BusinessService.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/09.
//

import Foundation

protocol BusinessService {
    
    func registerEvaluate(estimateRequest: EstimateRequest, products: [Product]) async throws
    func queryHSCode(code: String) async throws -> [String]
    func queryEstimateRequests() async throws -> [EstimateRequest]
    
}
