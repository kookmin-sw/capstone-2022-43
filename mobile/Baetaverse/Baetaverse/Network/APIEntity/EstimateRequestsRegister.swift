//
//  EstimateRequestsRegister.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/13.
//

import Foundation

extension APIEntity {
    
    struct EstimateRequestsRegister {
        
        let tradeType: String
        let tradeDetail: String
        let forwardingDate: Date
        let departureCountry: String
        let departureDetail: String
        let destinationCountry: String
        let destinationDetail: String
        let incoterms: String
        let closingDate: Date
        
    }
    
}
