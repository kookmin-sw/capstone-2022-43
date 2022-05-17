//
//  EstimateEntity.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/16.
//

import Foundation

struct Estimate {
    
    var requestId: Int
    var oceanFreightPrice: Int
    var inlandFreightPrice: Int
    var totalPrice: Int
    var estimatedTime: Int
    
}

extension Estimate {
    
    init(quotation: APIEntity.QuotationDetail) {
        self.requestId = quotation.requests.id ?? 0
        self.oceanFreightPrice = quotation.oceanFreightPrice
        self.inlandFreightPrice = quotation.inlandFreightPrice
        self.totalPrice = quotation.totalPrice
        self.estimatedTime = quotation.estimatedTime
    }
    
    init(quotation: APIEntity.Quotation) {
        self.requestId = 0
        self.oceanFreightPrice = quotation.oceanFreightPrice
        self.inlandFreightPrice = quotation.inlandFreightPrice
        self.totalPrice = quotation.totalPrice
        self.estimatedTime = quotation.estimatedTime
    }
    
}
