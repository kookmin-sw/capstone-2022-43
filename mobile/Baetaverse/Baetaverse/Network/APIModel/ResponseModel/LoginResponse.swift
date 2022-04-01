//
//  LoginResponse.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/03/31.
//

import Foundation

extension APIResponseModel {
    
    struct LoginResponse: Decodable {
        
        let message: String
        let token: String
        
        enum CodingKeys: CodingKey {
            
            case message
            case token
            
        }
        
    }
    
}
