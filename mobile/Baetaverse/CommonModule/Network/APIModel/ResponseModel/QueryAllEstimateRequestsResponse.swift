//
//  QueryAllEstimateRequestsResponse.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/17.
//

import Foundation

extension APIResponseModel {
    
    struct QueryAllEstimateRequestsResponse: Decodable {
        
        let status: Int
        let message: String
        let selectedRequests: [APIEntity.EstimateRequestDetail]
        
    }
    
}
