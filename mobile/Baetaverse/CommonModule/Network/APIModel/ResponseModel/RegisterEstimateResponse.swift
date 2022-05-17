//
//  RegisterEstimateResponse.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/16.
//

import Foundation

extension APIResponseModel {
    
    struct RegisterEstimateResponse: Decodable {
        
        let status: Int
        let message: String
        let quotation: APIEntity.Quotation
        let selectedGoods: APIEntity.GoodsDetail
        
        enum CodingKeys: String, CodingKey {
            
            case status
            case message
            case quotation = "Quotation"
            case selectedGoods
            
        }
        
    }
    
}
