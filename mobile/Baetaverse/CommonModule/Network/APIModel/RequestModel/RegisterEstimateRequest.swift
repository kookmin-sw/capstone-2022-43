//
//  RegisterEstimateRequest.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/16.
//

import Foundation

extension APIRequestModel {
    
    struct RegisterEstimateRequest: BaetaverseAPIRequestPOST {
        
        var path: String = "/api/quotations"
        var headers: [String: String]
        var contentType: String = "application/json"
        var query: [String: String] = [:]
        var body: Data?
        
        init(token: String, estimate: Estimate) {
            self.headers = ["Authorization": "Bearer \(token)"]
            
            let parameter = [
                "ocean_freight_price": estimate.oceanFreightPrice,
                "inland_freight_price": estimate.inlandFreightPrice,
                "total_price": estimate.totalPrice,
                "estimated_time": estimate.estimatedTime,
                "request_id": estimate.requestId
            ]
            
            self.body = try? parameter.encodeToJSONData()
        }
        
    }
    
}
