//
//  ReviewsRequest.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/18.
//

import Foundation

extension APIEntity {
    
    struct ReviewsRequest: BaetaverseAPIRequestGET {
        
        var path: String = "/api/reviews"
        var headers: [String: String]
        var parameters: [String: String] = [: ]
        
        init(token: String) {
            self.headers = ["Authorization": "Bearer \(token)"]
        }
        
    }
    
}
