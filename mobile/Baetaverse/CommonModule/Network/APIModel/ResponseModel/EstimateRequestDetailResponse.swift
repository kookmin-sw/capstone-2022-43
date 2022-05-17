//
//  EstimateRequestDetailResponse.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/13.
//

import Foundation

extension APIResponseModel {
    
    struct EstimateRequestDetailResponse: Decodable {
        
        let status: Int
        let message: String
        let selectedRequest: APIEntity.EstimateRequestDetail
        let selectedGoods: [APIEntity.GoodsDetail]
        
        enum CodingKeys: CodingKey {
            
            case status
            case message
            case selectedRequest
            case selectedGoods
            
        }
        
    }
    
}
