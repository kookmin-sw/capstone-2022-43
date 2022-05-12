//
//  EstimateRequestsRequest.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/09.
//

import Foundation

extension APIRequestModel {
    
    struct EstimateRequestsRequest: BaetaverseAPIRequestGET {
        
        var path: String = "/api/requests"
        var headers: [String: String]
        var parameters: [String: String] = [:]
        
        init(token: String) {
            self.headers = ["Authorization": "Bearer \(token)"]
        }
        
    }
    
}
