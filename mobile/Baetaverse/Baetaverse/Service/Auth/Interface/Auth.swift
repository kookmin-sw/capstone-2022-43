//
//  Auth.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/04/01.
//

import Foundation

protocol Auth {
    
    var isLogin: Bool { get }
    var token: String { get }
    
    func login(email: String, password: String) async throws
    func logout()
    func signUp(email: String, password: String, name: String) async throws
    
}
