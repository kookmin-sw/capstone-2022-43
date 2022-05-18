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
    
    func registerEstimate(token: String, estimate: Estimate) async throws {
        let apiService = BaetaverseAPIService.registerEstimate(
            token: token,
            estimate: estimate
        )
        _ = try await networkService.fetchData(for: apiService)
    }
    
    func registerEvaluateRequest(token: String, estimateRequest: EstimateRequest, products: [Product]) async throws {
        let apiService = BaetaverseAPIService.registerEstimateRequest(
            token: token,
            estimateRequest: estimateRequest,
            products: products
        )
        _ = try await networkService.fetchData(for: apiService)
    }
    
    func registerReview(token: String, quotationId: Int, requestId: Int, score: Int, message: String) async throws {
        let apiService = BaetaverseAPIService.registerReview(
            token: token,
            quotationId: quotationId,
            requestId: requestId,
            score: score,
            message: message
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
    
    func queryEstimates(token: String) async throws -> [QuotationEntity] {
        let apiService = BaetaverseAPIService.queryEstimates(token: token)
        let data = try await networkService.fetchData(for: apiService)
        let object = try data.decodeJSONData(to: APIResponseModel.QuotationsResponse.self)
        let quotation = object.quotation.map { data in
            QuotationEntity(quotation: data)
        }
        return quotation
    }
    
    func queryAllEstimatesRequest(token: String) async throws -> [EstimateRequest] {
        let apiService = BaetaverseAPIService.queryAllEstimatesRequest(token: token)
        let data = try await networkService.fetchData(for: apiService)
        let object = try data.decodeJSONData(to: APIResponseModel.QueryAllEstimateRequestsResponse.self)
        return object.selectedRequests.map { estimateRequest in
            EstimateRequest(estimateRequestDetail: estimateRequest)
        }
    }
    
    func queryReviews(token: String) async throws -> [ReviewEntity] {
        let apiService = BaetaverseAPIService.queryReviews(token: token)
        let datas = try await networkService.fetchData(for: apiService)
        let objects = try datas.decodeJSONData(to: APIResponseModel.ReviewsResponse.self)
        let results = objects.review.map { ReviewEntity(review: $0) }
        return results
    }
    
    func queryEstimatesWithEstimateRequest(token: String, estimateRequestId: String) async throws -> [QuotationEntity] {
        let apiService = BaetaverseAPIService.queryEstimatesWithEstimateRequest(
            token: token,
            estimateRequestId: estimateRequestId
        )
        let data = try await networkService.fetchData(for: apiService)
        let object = try data.decodeJSONData(to: APIResponseModel.QuotationsResponse.self)
        let quotation = object.quotation.map { data in
            QuotationEntity(quotation: data)
        }
        return quotation
    }
    
    enum BusinessServiceError: Error {
        
        case hscodeQueryFailure
        case estimatesQueryFailure
        
    }
    
}
