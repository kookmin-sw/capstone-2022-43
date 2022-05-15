//
//  SignUpResponse.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/03/31.
//

import Foundation

extension APIResponseModel {
    
    struct SignUpResponse: Decodable {
        
        let status: Int
        let message: String
        let email: String
        let name: String
        
        enum CodingKeys: CodingKey {
            
            case status
            case message
            case email
            case name
            
        }
        
    }
    
}
