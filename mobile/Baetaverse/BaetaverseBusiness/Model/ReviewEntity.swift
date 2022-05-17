//
//  ReviewEntity.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/02.
//

import Foundation

struct ReviewEntity: Identifiable {
    
    var id: UUID
    var forwarder: String
    var owner: String
    var rating: Int
    var reviewText: String
    var estimate: Estimate
    var estimateRequest: EstimateRequest
    var created: Date

}

extension ReviewEntity {
    
    init(review: APIEntity.Review) {
        self.id = UUID()
        self.forwarder = review.forwarder.name
        self.owner = review.owner.name
        self.rating = review.score
        self.reviewText = review.message
        self.estimate = Estimate(quotation: review.quotation)
        self.estimateRequest = EstimateRequest(estimateRequestDetail: review.requests)
        self.created = Date()
    }
    
}
