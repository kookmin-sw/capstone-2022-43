//
//  HSCodeRequest.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/12.
//

import Foundation

extension APIRequestModel {
    
    struct HSCodeRequest: BaetaverseAPIRequestGET {
        
        var path: String
        var headers: [String: String]
        var parameters: [String: String]
        
        init(token: String, code: String) {
            self.path = "/api/hscode/\(code)"
            self.headers = ["Authorization": "Bearer \(token)"]
            self.parameters = [:]
        }
        
    }
    
}
