//
//  SignUpResponse.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/03/31.
//

import Foundation

extension APIResponseModel {
    
    struct SignUpResponse: Decodable {
        
        let message: String
        
        enum CodingKeys: CodingKey {
            
            case message
            
        }
        
    }
    
}
