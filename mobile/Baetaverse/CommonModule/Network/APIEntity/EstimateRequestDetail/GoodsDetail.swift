//
//  GoodsDetail.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/13.
//

import Foundation

extension APIEntity {
    
    struct GoodsDetail: Decodable {
        
        let id: Int
        let name: String
        let price: Int
        let weight: Int
        let standardUnit: String
        let hscode: String
        let createdAt: Date
        
        enum CodingKeys: String, CodingKey {
            
            case id
            case name
            case price
            case weight
            case standardUnit = "standard_unit"
            case hscode
            case createdAt = "created_at"
            
        }
        
    }
    
}
