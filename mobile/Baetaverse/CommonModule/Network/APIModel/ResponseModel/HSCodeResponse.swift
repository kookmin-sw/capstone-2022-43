//
//  HSCodeResponse.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/12.
//

import Foundation

extension APIResponseModel {
    
    struct HSCodeResponse: Decodable {
        
        let status: Int
        let message: String
        let hscode: [String]
        
        enum CodingKeys: CodingKey {
            
            case status
            case message
            case hscode
            
        }
        
    }
    
}
