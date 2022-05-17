//
//  QueryAllEstimateRequestsRequest.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/17.
//

import Foundation

extension APIRequestModel {
    
    struct QueryAllEstimateRequestsRequest: BaetaverseAPIRequestGET {
        
        var path: String = "/api/requests/list"
        var headers: [String: String]
        var parameters: [String: String] = [: ]
        
        init(token: String) {
            self.headers = ["Authorization": "Bearer \(token)"]
        }
        
    }
    
}
