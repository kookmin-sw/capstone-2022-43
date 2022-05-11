//
//  AuthService.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/09.
//

import Foundation

protocol AuthService {
    
    var isLogin: Bool { get }
    
    func login(email: String, password: String) async throws
    func logout()
    func signUp(email: String, password: String, name: String, phoneNumber: String) async throws
    
}
