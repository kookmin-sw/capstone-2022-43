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
    
    func registerEvaluate(token: String, estimateRequest: EstimateRequest, products: [Product]) async throws {
        let apiService = BaetaverseAPIService.registerEstimateRequest(
            token: token,
            estimateRequest: estimateRequest,
            products: products
        )
        _ = try await networkService.fetchData(for: apiService)
    }
    
    func queryEstimateRequests(token: String) async throws -> [EstimateRequest] {
        let apiService = BaetaverseAPIService.queryEstimateRequests(token: token)
        let data = try await networkService.fetchData(for: apiService)
        let object = try data.decodeJSONData(to: APIResponseModel.EstimateRequestsResponse.self)
        return object.selectedRequests.map { estimateRequest in
            EstimateRequest(estimateRequestQuery: estimateRequest)
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
    
    func queryEstimateRequestDetail(token: String, id: String) async throws -> (EstimateRequest, [Product]) {
        let apiService = BaetaverseAPIService.queryEstimateRequestDetail(token: token, id: id)
        let data = try await networkService.fetchData(for: apiService)
        let object = try data.decodeJSONData(to: APIResponseModel.EstimateRequestDetailResponse.self)
        
        let estimateRequest = EstimateRequest(estimateRequestDetail: object.selectedRequest)
        let products = object.selectedGoods.map { goods in
            Product(goods: goods)
        }
        
        return (estimateRequest, products)
    }
    
    enum BusinessServiceError: Error {
        
        case hscodeQueryFailure
        
    }
    
}
