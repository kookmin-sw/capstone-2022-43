//
//  RegisterEstimateRequestsResponse.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/13.
//

import Foundation

extension APIResponseModel {
    
    struct RegisterEstimateRequestsResponse: Decodable {
        
        let status: Int
        let message: String
        let selectedRequest: APIEntity.EstimateRequestDetail
        let selectedGoods: 
        
    }
    
}
