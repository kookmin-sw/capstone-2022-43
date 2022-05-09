//
//  SignUpRequest.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/03/29.
//

import Foundation

extension APIRequestModel {
    
    struct SignUpRequest: BaetaverseAPIRequestPOST {
        
        var path: String = "/api/auth/signup"
        var headers: [String: String] = [:]
        var contentType: String = "application/json"
        var query: [String: String] = [:]
        var body: Data?
        
        init(email: String, password: String, name: String) {
            let parameters = [
                "email": email,
                "password": password,
                "name": name
            ]
            self.body = try? parameters.encodeToJSONData()
        }
        
    }
    
}
