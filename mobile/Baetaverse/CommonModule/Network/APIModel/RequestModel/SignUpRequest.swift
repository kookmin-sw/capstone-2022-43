//
//  SignUpOwnerRequest.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/03/29.
//

import Foundation

extension APIRequestModel {
    
    struct SignUpRequest: BaetaverseAPIRequestPOST {
        
        var path: String
        var headers: [String: String] = [:]
        var contentType: String = "application/json"
        var query: [String: String] = [:]
        var body: Data?
        
        init(permission: String, email: String, password: String, name: String,
             phoneNumber: String, corporationName: String? = nil,
             corporationNumber: String? = nil) {
            self.path = "/api/auth/signup/" + permission
            
            var parameters = [
                "email": email,
                "password": password,
                "name": name,
                "phone_number": phoneNumber
            ]
            
            if let corporationName = corporationName,
                let corporationNumber = corporationNumber {
                parameters["corporation_name"] = corporationName
                parameters["corporation_number"] = corporationNumber
            }
            
            self.body = try? parameters.encodeToJSONData()
        }
        
    }
    
}
