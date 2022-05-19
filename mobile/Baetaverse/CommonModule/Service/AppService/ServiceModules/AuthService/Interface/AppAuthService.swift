//
//  AppAuthService.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/04/01.
//

import Foundation

protocol AppAuthService {
    
    var isLogin: Bool { get }
    var token: String { get }
    
    func login(permission: AuthPermission, email: String, password: String) async throws
    func logout()
    func signUp(permission: AuthPermission, email: String, password: String,
                name: String, phoneNumber: String, corporationName: String?,
                corporationNumber: String?) async throws
    
}
