//
//  EstimateRequestsResponse.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/12.
//

import Foundation

extension APIResponseModel {
    
    struct EstimateRequestsResponse: Decodable {
        
        let status: Int
        let message: String
        let selectedRequests: [APIEntity.EstimateRequestsQuery]
        
        enum CodingKeys: CodingKey {
            
            case status
            case message
            case selectedRequests
            
        }
        
    }
    
}
