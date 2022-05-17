//
//  UserProfile.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/17.
//

import Foundation

struct UserProfile {
    
    var name: String
    var phoneNumber: String
    var corporationName: String
    var corporationNumber: String
    
}

extension UserProfile {
    
    init(quotation: APIEntity.Quotation) {
        self.name = quotation.forwarder.name
        self.phoneNumber = quotation.forwarder.phoneNumber
        self.corporationName = quotation.forwarder.corporationName 
        self.corporationNumber = quotation.forwarder.corporationNumber 
    }
    
}
