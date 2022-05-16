//
//  SignUpOwnerRequest.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/03/29.
//

import Foundation

extension APIRequestModel {
    
    struct SignUpOwnerRequest: BaetaverseAPIRequestPOST {
        
        var path: String = "/api/auth/signup"
        var headers: [String: String] = [:]
        var contentType: String = "application/json"
        var query: [String: String] = [:]
        var body: Data?
        
        init(email: String, password: String, name: String, phoneNumber: String) {
            let parameters = [
                "email": email,
                "password": password,
                "name": name,
                "phone_number": phoneNumber
            ]
            self.body = try? parameters.encodeToJSONData()
        }
        
    }
    
}
