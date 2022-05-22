//
//  LoginViewModel.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/17.
//

import Foundation

final class LoginViewModel: ObservableObject {
    
    private var appService: AppService {
        BaetaverseBusinessApp.appService
    }
    
    func login(email: String, password: String) async throws {
        try await appService.login(
            permission: .forwarder,
            email: email,
            password: password
        )
    }
    
}
