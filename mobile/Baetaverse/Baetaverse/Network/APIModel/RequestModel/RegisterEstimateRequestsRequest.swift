//
//  RegisterEstimateRequestsRequest.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/03/29.
//

import Foundation

extension APIRequestModel {
    
    struct RegisterEstimateRequestsRequest: BaetaverseAPIRequestPOST {
        
        var path: String = "/api/requests"
        var headers: [String: String]
        var contentType: String = "application/json"
        var query: [String: String] = [:]
        var body: Data?
        
        init(token: String, estimateRequest: EstimateRequest, products: [Product]) {
            self.headers = ["Authorization": "Bearer \(token)"]
            
            let quoteRequest = APIEntity.EstimateRequestsRegister(estimateRequest: estimateRequest)
            let goodsRequests = products.map { product in
                APIEntity.GoodsRegister(product: product)
            }
            
            let parameter = APIEntity.EstimateRequestRegisterForm(
                quoteRequest: quoteRequest,
                goodsRequests: goodsRequests
            )
            
            self.body = try? parameter.encodeToJSONData()
        }
        
    }
    
}
