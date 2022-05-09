//
//  BaetaverseAppService.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/04/01.
//

import Foundation

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
    
    static func configure() -> BaetaverseAppService {
        let networkService = NetworkServiceProvider()
        let auth = BaetaverseAuth(networkService: networkService)
        let businessService = BaetaverseBusinessService(networkService: networkService)
        return BaetaverseAppService(auth: auth, businessService: businessService)
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
    
    func registerEvaluate(id: String, HSCode: String, country: String) async throws {
        try await businessService.registerEvaluate(
            token: token,
            id: id,
            HSCode: HSCode,
            country: country
        )
    }
    
    func fetchEvaluates() async throws -> [Estimate] {
        return try await businessService.fetchEvaluates(token: token)
    }
    
}
