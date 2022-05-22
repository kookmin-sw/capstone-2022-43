//
//  EstimateRequestsQuotationRequest.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/18.
//

import Foundation

extension APIRequestModel {
    
    struct EstimateRequestsQuotationRequest: BaetaverseAPIRequestGET {
        
        var path: String
        var headers: [String: String]
        var parameters: [String: String] = [:]
        
        init(token: String, id: String) {
            self.path = "/api/requests/\(id)/quotations"
            self.headers = ["Authorization": "Bearer \(token)"]
        }
        
    }
    
}
