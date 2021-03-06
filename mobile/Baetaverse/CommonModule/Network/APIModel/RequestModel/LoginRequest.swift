//
//  LoginRequest.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/03/29.
//

import Foundation

extension APIRequestModel {
    
    struct LoginRequest: BaetaverseAPIRequestPOST {
        
        var path: String = "/api/auth/login"
        var headers: [String: String] = [:]
        var contentType: String = "application/json"
        var query: [String: String] = [:]
        var body: Data?
        
        init(permission: String, email: String, password: String) {
            self.path = "/api/auth/login/" + permission
            let parameter = [
                "email": email,
                "password": password
            ]
            self.body = try? parameter.encodeToJSONData()
        }
        
    }
    
}
