//
//  QuotationDetail.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/16.
//

import Foundation

extension APIEntity {
    
    struct QuotationDetail: Decodable {
        
        var id: Int
        var oceanFreightPrice: Int
        var inlandFreightPrice: Int
        var totalPrice: Int
        var estimatedTime: Int
        var createdAt: Date
        var forwarder: APIEntity.Forwarder
        var requests: APIEntity.EstimateRequestDetail
        
        enum CodingKeys: String, CodingKey {
            
            case id
            case oceanFreightPrice = "ocean_freight_price"
            case inlandFreightPrice = "inland_freight_price"
            case totalPrice = "total_price"
            case estimatedTime = "estimated_time"
            case createdAt = "created_at"
            case forwarder
            case requests
            
        }
        
    }
    
}
