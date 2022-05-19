//
//  EstimateRequestsRegister.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/13.
//

import Foundation

extension APIEntity {
    
    struct EstimateRequestsRegister: Encodable {
        
        let tradeType: String
        let tradeDetail: String
        let forwardingDate: Date
        let departureCountry: String
        let departureDetail: String
        let destinationCountry: String
        let destinationDetail: String
        let incoterms: String
        let closingDate: Date
        
        enum CodingKeys: String, CodingKey {
            
            case tradeType = "trade_type"
            case tradeDetail = "trade_detail"
            case forwardingDate = "forwarding_date"
            case departureCountry = "departure_country"
            case departureDetail = "departure_detail"
            case destinationCountry = "destination_country"
            case destinationDetail = "destination_detail"
            case incoterms = "incoterms"
            case closingDate = "closing_date"
            
        }
        
    }
    
}

extension APIEntity.EstimateRequestsRegister {
    
    init(estimateRequest: EstimateRequest) {
        self.tradeType = estimateRequest.tradeType
        self.tradeDetail = estimateRequest.tradeDetail
        self.forwardingDate = estimateRequest.forwardingDate
        self.departureCountry = estimateRequest.departureCountry
        self.departureDetail = estimateRequest.departureDetail
        self.destinationCountry = estimateRequest.destinationCountry
        self.destinationDetail = estimateRequest.destinationDetail
        self.incoterms = estimateRequest.incoterms
        self.closingDate = estimateRequest.closingDate
    }
    
}
