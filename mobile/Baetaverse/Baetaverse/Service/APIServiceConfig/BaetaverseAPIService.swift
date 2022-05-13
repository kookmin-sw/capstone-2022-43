//
//  BaetaverseAPIService.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/03/30.
//

import Foundation

enum BaetaverseAPIService {
    
    case signUp(email: String, password: String, name: String, phoneNumber: String)
    case login(email: String, password: String)
    case quoteRequest(token: String, id: String, HSCode: String, country: String)
    case queryEstimateRequests(token: String)
    case queryHSCode(token: String, code: String)
    
}

extension BaetaverseAPIService: APIService {
    
    var urlRequest: URLRequest? {
        switch self {
        case .signUp(let email, let password, let name, let phoneNumber):
            let requestModel = APIRequestModel.SignUpRequest(
                email: email,
                password: password,
                name: name,
                phoneNumber: phoneNumber
            )
            return requestModel.urlRequest
        case .login(let email, let password):
            let requestModel = APIRequestModel.LoginRequest(
                email: email,
                password: password
            )
            return requestModel.urlRequest
        case .quoteRequest(let token, let id, let HSCode, let country):
            let requestModel = APIRequestModel.QuoteRequest(
                token: token,
                id: id,
                HSCode: HSCode,
                country: country
            )
            return requestModel.urlRequest
        case .queryEstimateRequests(let token):
            let requestModel = APIRequestModel.EstimateRequestsRequest(token: token)
            return requestModel.urlRequest
        case .queryHSCode(let token, let code):
            let requestModel = APIRequestModel.HSCodeRequest(
                token: token,
                code: code
            )
            return requestModel.urlRequest
        }
    }
    
}
