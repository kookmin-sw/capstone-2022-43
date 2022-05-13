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
    let forwardingDate: Date
    let departureCountry: String
    let departureDetail: String
    let destinationCountry: String
    let destinationDetail: String
    let incoterms: String
    let closingDate: Date
    let createdAt: Date?
    
}

extension EstimateRequest {
    
    init(estimateRequestQuery: APIEntity.EstimateRequestsQuery) {
        self.id = estimateRequestQuery.id
        self.tradeType = estimateRequestQuery.tradeType
        self.tradeDetail = estimateRequestQuery.tradeDetail
        self.forwardingDate = estimateRequestQuery.forwardingDate
        self.departureCountry = estimateRequestQuery.departureCountry
        self.departureDetail = estimateRequestQuery.departureDetail
        self.destinationCountry = estimateRequestQuery.destinationCountry
        self.destinationDetail = estimateRequestQuery.destinationDetail
        self.incoterms = estimateRequestQuery.incoterms
        self.closingDate = estimateRequestQuery.closingDate
        self.createdAt = estimateRequestQuery.createdAt
    }
    
    init(estimateRequestDetail: APIEntity.EstimateRequestDetail) {
        self.id = estimateRequestDetail.id
        self.tradeType = estimateRequestDetail.tradeType
        self.tradeDetail = estimateRequestDetail.tradeDetail
        self.forwardingDate = estimateRequestDetail.forwardingDate
        self.departureCountry = estimateRequestDetail.departureCountry
        self.departureDetail = estimateRequestDetail.departureDetail
        self.destinationCountry = estimateRequestDetail.destinationCountry
        self.destinationDetail = estimateRequestDetail.destinationDetail
        self.incoterms = estimateRequestDetail.incoterms
        self.closingDate = estimateRequestDetail.closingDate
        self.createdAt = estimateRequestDetail.createdAt
    }
    
}
