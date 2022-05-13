//
//  BaetaverseBusinessService.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/04/01.
//

import Foundation

final class BaetaverseBusinessService: AppBusinessService {
    
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func registerEvaluate(token: String, id: String, HSCode: String, country: String) async throws {
        let apiService = BaetaverseAPIService.quoteRequest(
            token: token,
            id: id,
            HSCode: HSCode,
            country: country
        )
        _ = try await networkService.fetchData(for: apiService)
    }
    
    func fetchEvaluates(token: String) async throws -> [Estimate] {
        let apiService = BaetaverseAPIService.queryEstimateRequests(token: token)
        let data = try await networkService.fetchData(for: apiService)
        let object = try data.decodeJSONData(to: [APIResponseModel.EstimatesResponse].self)
        return object.map { estimate in
            Estimate(
                id: estimate.id,
                quoteId: estimate.quoteId,
                hsCode: estimate.hsCode,
                country: estimate.country,
                createdAt: estimate.createdAt
            )
        }
    }
    
    func queryEstimateRequests(token: String) async throws -> [EstimateRequest] {
        let apiService = BaetaverseAPIService.queryEstimateRequests(token: token)
        let data = try await networkService.fetchData(for: apiService)
        let object = try data.decodeJSONData(to: APIResponseModel.EstimateRequestsResponse.self)
        return object.selectedRequests.map { estimateRequest in
            EstimateRequest(estimateRequest: estimateRequest)
        }
    }
    
    func queryHSCode(token: String, code: String) async throws -> [String] {
        let apiService = BaetaverseAPIService.queryHSCode(token: token, code: code)
        let data = try await networkService.fetchData(for: apiService)
        let object = try data.decodeJSONData(to: APIResponseModel.HSCodeResponse.self)
        
        if (400...499).contains(object.status) {
            throw BusinessServiceError.hscodeQueryFailure
        }
        
        return object.hscode
    }
    
    enum BusinessServiceError: Error {
        
        case hscodeQueryFailure
        
    }
    
}
