//
//  EstimateRequest.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/12.
//

import Foundation

struct EstimateRequest: Identifiable {
    
    let id: Int?
    let tradeType: String
    let tradeDetail: String
    let forwardingDate: Int
    let departureCountry: String
    let departureDetail: String
    let destinationCountry: String
    let destinationDetail: String
    let incoterms: String
    let closingDate: Date
    let createdAt: Date?
    
}

extension EstimateRequest {
    
    init(estimateRequest: APIEntity.EstimateRequestsQuery) {
        self.id = estimateRequest.id
        self.tradeType = estimateRequest.tradeType
        self.tradeDetail = estimateRequest.tradeDetail
        self.forwardingDate = estimateRequest.forwardingDate
        self.departureCountry = estimateRequest.departureCountry
        self.departureDetail = estimateRequest.departureDetail
        self.destinationCountry = estimateRequest.destinationCountry
        self.destinationDetail = estimateRequest.destinationDetail
        self.incoterms = estimateRequest.incoterms
        self.closingDate = estimateRequest.closingDate
        self.createdAt = estimateRequest.createdAt
    }
    
}
