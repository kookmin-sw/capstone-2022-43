//
//  BaetaverseAuth.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/03/30.
//

import Foundation

protocol AppService: Auth, BusinessService { }

protocol Auth {
    
    var isLogin: Bool { get }
    var token: String { get }
    
    func login(email: String, password: String) async throws
    func logout()
    func signUp(email: String, password: String, name: String) async throws
    
}

protocol BusinessService {
    
    func registerEvaluate(token: String?, id: String, HSCode: String, country: String) async throws
    
}

class BaetaverseAppService: AppService {
   
    private let auth: Auth
    private let businessService: BusinessService
    
    init(auth: Auth, businessService: BusinessService) {
        self.auth = auth
        self.businessService = businessService
    }
    
    var isLogin: Bool {
        auth.isLogin
    }
    
    var token: String {
        auth.token
    }
    
    func login(email: String, password: String) async throws {
        try await auth.login(email: email, password: password)
    }
    
    func logout() {
        auth.logout()
    }
    
    func signUp(email: String, password: String, name: String) async throws {
        try await auth.signUp(email: email, password: password, name: name)
    }
    
    func registerEvaluate(token: String? = nil, id: String, HSCode: String, country: String) async throws {
        try await businessService.registerEvaluate(
            token: token ?? self.token,
            id: id,
            HSCode: HSCode,
            country: country
        )
    }
    
}


class BaetaverseAuth: Auth {
    
    private let networkService: NetworkService
    
    private var userToken: String? = nil
    
    var isLogin: Bool {
        self.userToken != nil
    }
    
    var token: String {
        self.userToken ?? ""
    }
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func login(email: String, password: String) async throws {
        let apiService = BaetaverseAPIService.login(
            email: email,
            password: password
        )
        let result = try await networkService.fetchData(for: apiService)
        let object = try result.decodeJSONData(to: APIResponseModel.LoginResponse.self)
        self.userToken = object.token
    }
    
    func logout() {
        if isLogin {
            self.userToken = nil
        }
    }
    
    func signUp(email: String, password: String, name: String) async throws {
        let apiService = BaetaverseAPIService.signUp(
            email: email,
            password: password,
            name: name
        )
        let result = try await networkService.fetchData(for: apiService)
        let object = try result.decodeJSONData(to: APIResponseModel.SignUpResponse.self)
        print(object)
    }
    
}

class BaetaverseBusinessService: BusinessService {
    
    private let networkService: NetworkService
    
    init(networkService: NetworkService) {
        self.networkService = networkService
    }
    
    func registerEvaluate(token: String?, id: String, HSCode: String, country: String) async throws {
        let apiService = BaetaverseAPIService.quoteRequest(
            token: token ?? "",
            id: id,
            HSCode: HSCode,
            country: country
        )
        let data = try await networkService.fetchData(for: apiService)
    }
    
}
