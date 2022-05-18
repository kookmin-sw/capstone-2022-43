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
    case registerEstimateRequest(token: String, estimateRequest: EstimateRequest, products: [Product])
    case queryEstimateRequests(token: String)
    case queryHSCode(token: String, code: String)
    case queryEstimateRequestDetail(token: String, id: String)
    
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
        case .registerEstimateRequest(let token, let estimateRequest, let products):
            let requestModel = APIRequestModel.RegisterEstimateRequestsRequest(
                token: token,
                estimateRequest: estimateRequest,
                products: products
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
        case .queryEstimateRequestDetail(let token, let id):
            let requestModel = APIRequestModel.EstimateRequestDetailRequest(
                token: token,
                id: id
            )
            return requestModel.urlRequest
        }
    }
    
}
