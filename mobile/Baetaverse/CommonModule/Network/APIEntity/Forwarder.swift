//
//  Forwarder.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/16.
//

import Foundation

extension APIEntity {
    
    struct UserInformation: Decodable {
        
        var name: String
        var phoneNumber: String?
        var corporationName: String?
        var corporationNumber: String?
        
        enum CodingKeys: String, CodingKey {
            
            case name
            case phoneNumber = "phone_number"
            case corporationName = "corporation_name"
            case corporationNumber = "corporation_number"
            
        }
        
    }
    
}
