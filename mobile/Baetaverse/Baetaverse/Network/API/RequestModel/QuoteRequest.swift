//
//  QuoteRequest.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/03/29.
//

import Foundation

extension APIRequestModel {
    
    struct QuoteRequest: BaetaverseAPIRequestPOST {
        
        var path: String = "/api/quote/QuoteRequest"
        var headers: [String : String]
        var contentType: String = "application/json"
        var query: [String : String] = [:]
        var body: Data?
        
        init(token: String, id: String, HSCode: String, country: String) {
            self.headers = ["Authorization": "Bearer \(token)"]
            let parameter = [
                "id": id,
                "HSCODE": HSCode,
                "country": country
            ]
            self.body = try? JSONEncoder.shared.encode(parameter)
        }
        
    }
    
}
