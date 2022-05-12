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
