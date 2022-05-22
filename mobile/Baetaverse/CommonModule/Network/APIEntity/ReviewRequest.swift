//
//  ReviewRequest.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/19.
//

import Foundation

extension APIEntity {
    
    struct ReviewRequest: Encodable {
        
        let score: Int
        let message: String
        let quotationId: Int
        let requestId: Int
        
        enum CodingKeys: String, CodingKey {
            
            case score
            case message
            case quotationId = "quotation_id"
            case requestId = "request_id"
            
        }
        
    }
    
}
