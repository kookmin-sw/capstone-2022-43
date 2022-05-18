//
//  EstimateRequestDetailRequest.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/13.
//

import Foundation

extension APIRequestModel {
    
    struct EstimateRequestDetailRequest: BaetaverseAPIRequestGET {
        
        var path: String
        var headers: [String: String]
        var parameters: [String: String]
        
        init(token: String, id: String) {
            self.path = "/api/requests/\(id)"
            self.headers = ["Authorization": "Bearer \(token)"]
            self.parameters = [:]
        }
        
    }
    
}
