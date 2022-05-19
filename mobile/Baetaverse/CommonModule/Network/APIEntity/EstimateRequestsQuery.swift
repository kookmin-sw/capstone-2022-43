//
//  EstimateRequestsQuery.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/13.
//

import Foundation

extension APIEntity {
    
    struct EstimateRequestsQuery: Decodable {
        
        let id: Int
        let tradeType: String
        let tradeDetail: String
        let forwardingDate: Date
        let departureCountry: String
        let departureDetail: String
        let destinationCountry: String
        let destinationDetail: String
        let incoterms: String
        let closingDate: Date
        let createdAt: Date?
        
        enum CodingKeys: String, CodingKey {
            
            case id
            case tradeType = "trade_type"
            case tradeDetail = "trade_detail"
            case forwardingDate = "forwarding_date"
            case departureCountry = "departure_country"
            case departureDetail = "departure_detail"
            case destinationCountry = "destination_country"
            case destinationDetail = "destination_detail"
            case incoterms
            case closingDate = "closing_date"
            case createdAt = "created_at"
            
        }
        
    }
    
}
