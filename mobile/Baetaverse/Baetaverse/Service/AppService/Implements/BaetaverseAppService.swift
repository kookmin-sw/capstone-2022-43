//
//  BaetaverseAppService.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/04/01.
//

import Foundation

final class BaetaverseAppService: AppService {
    
    private let auth: AppAuthService
    private let businessService: AppBusinessService
    
    var isLogin: Bool {
        auth.isLogin
    }
    
    init(auth: AppAuthService, businessService: AppBusinessService) {
        self.auth = auth
        self.businessService = businessService
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
    
    func signUp(email: String, password: String, name: String, phoneNumber: String) async throws {
        try await auth.signUp(email: email, password: password, name: name, phoneNumber: phoneNumber)
    }
    
    func registerEvaluate(id: String, HSCode: String, country: String) async throws {
        try await businessService.registerEvaluate(
            token: auth.token,
            id: id,
            HSCode: HSCode,
            country: country
        )
    }
    
    func fetchEvaluates() async throws -> [Estimate] {
        return try await businessService.fetchEvaluates(token: auth.token)
    }
    
}
