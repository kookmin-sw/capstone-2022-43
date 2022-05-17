//
//  EstimateRequestRegisterForm.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/13.
//

import Foundation

extension APIEntity {
    
    struct EstimateRequestRegisterForm: Encodable {
        
        let quoteRequest: APIEntity.EstimateRequestsRegister
        let goodsRequests: [GoodsRegister]
        
        enum CodingKeys: CodingKey {
            
            case quoteRequest
            case goodsRequests
            
        }
        
    }
    
}
