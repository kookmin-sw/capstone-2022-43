//
//  QuotationEntity.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/17.
//

import Foundation

struct QuotationEntity: Identifiable {
    
    var id: Int
    var estimate: Estimate
    var forwarder: UserProfile
    var estimateRequest: EstimateRequest
    
}

extension QuotationEntity {
    
    init(quotation: APIEntity.QuotationDetail) {
        self.id = quotation.id
        self.estimate = Estimate(quotation: quotation)
        self.forwarder = UserProfile(quotation: quotation)
        self.estimateRequest = EstimateRequest(estimateRequestDetail: quotation.requests)
    }
    
}
