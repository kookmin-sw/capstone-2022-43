//
//  BaetaverseAuth.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/03/30.
//

import Foundation

final class BaetaverseAuth: AppAuthService {
    
    private let networkService: NetworkService
    
    private var userToken: String?
    
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
    
    func signUp(email: String, password: String, name: String, phoneNumber: String) async throws {
        let apiService = BaetaverseAPIService.signUp(
            email: email,
            password: password,
            name: name,
            phoneNumber: phoneNumber
        )
        
        let data = try await networkService.fetchData(for: apiService)
        let result = try data.decodeJSONData(to: APIResponseModel.SignUpResponse.self)
        
        if result.status == 400 {
            throw AuthError.alreadyExistUserError
        }
    }
    
    enum AuthError: Error {
        
        case alreadyExistUserError
        case notExistUserError
        case invalidPasswordError
        
    }
    
}
