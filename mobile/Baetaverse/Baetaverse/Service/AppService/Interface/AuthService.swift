//
//  AuthService.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/09.
//

import Foundation

protocol AuthService {
    
    var isLogin: Bool { get }
    
    func login(permission: AuthPermission, email: String, password: String) async throws
    func logout()
    func signUp(permission: AuthPermission, email: String, password: String, name: String, phoneNumber: String, corporationName: String?, corporationNumber: String?) async throws
    
}
