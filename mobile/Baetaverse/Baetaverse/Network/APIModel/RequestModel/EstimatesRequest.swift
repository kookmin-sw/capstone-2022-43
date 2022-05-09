//
//  EstimatesRequest.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/09.
//

import Foundation

extension APIRequestModel {
    
    struct EstimatesRequest: BaetaverseAPIRequestGET {
        
        var path: String = "/api/quote/list"
        var headers: [String : String] = [:]
        var parameters: [String : String] = [:]
        
    }
    
}
