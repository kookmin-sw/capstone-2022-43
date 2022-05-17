//
//  Review.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/18.
//

import Foundation

extension APIEntity {
    
    struct Review: Decodable {
        
        let score: Int
        let message: String
        let forwarder: APIEntity.UserInformation
        let owner: APIEntity.UserInformation
        let requests: APIEntity.EstimateRequestDetail
        let quotation: APIEntity.Quotation
        
    }
    
}
