//
//  BaetaverseBusinessApp.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/04/27.
//

import SwiftUI

@main
struct BaetaverseBusinessApp: App {
    
    static var appService: AppService = BaetaverseAppService.configure()
    
    var body: some Scene {
        WindowGroup {
            if Self.appService.isLogin {
                MainView()
            } else {
                LoginView()
            }
        }
    }
    
}
