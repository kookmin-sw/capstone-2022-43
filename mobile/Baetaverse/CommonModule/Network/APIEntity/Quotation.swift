//
//  Quotation.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/18.
//

import Foundation

extension APIEntity {
    
    struct Quotation: Decodable {
        
        var id: Int
        var oceanFreightPrice: Int
        var inlandFreightPrice: Int
        var totalPrice: Int
        var estimatedTime: Int
        var createdAt: Date
        
        enum CodingKeys: String, CodingKey {
            
            case id
            case oceanFreightPrice = "ocean_freight_price"
            case inlandFreightPrice = "inland_freight_price"
            case totalPrice = "total_price"
            case estimatedTime = "estimated_time"
            case createdAt = "created_at"
            
        }
        
    }
    
}
