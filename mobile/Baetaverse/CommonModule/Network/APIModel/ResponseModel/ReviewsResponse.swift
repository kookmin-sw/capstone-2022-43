//
//  ReviewsResponse.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/18.
//

import Foundation

extension APIResponseModel {
    
    struct ReviewsResponse: Decodable {
        
        let status: Int
        let message: String
        let review: APIEntity.Review
        
        enum CodingKeys: String, CodingKey {
            
            case status
            case message
            case review = "Review"
            
        }
        
    }
    
}
