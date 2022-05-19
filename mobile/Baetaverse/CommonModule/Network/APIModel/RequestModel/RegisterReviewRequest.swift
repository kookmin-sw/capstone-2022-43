//
//  RegisterReviewRequest.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/19.
//

import Foundation

extension APIRequestModel {
    
    struct RegisterReviewRequest: BaetaverseAPIRequestPOST {
        
        var path: String = "/api/reviews"
        var headers: [String: String]
        var contentType: String = "application/json"
        var query: [String: String] = [:]
        var body: Data?
        
        init(token: String, quotationId: Int, requestId: Int, score: Int, message: String) {
            self.headers = ["Authorization": "Bearer \(token)"]
            let parameter = APIEntity.ReviewRequest(
                score: score,
                message: message,
                quotationId: quotationId,
                requestId: requestId
            )
            self.body = try? parameter.encodeToJSONData()
        }
        
    }
    
}
