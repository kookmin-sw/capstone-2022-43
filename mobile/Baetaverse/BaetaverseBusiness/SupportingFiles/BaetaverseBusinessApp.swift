//
//  BaetaverseBusinessApp.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/04/27.
//

import SwiftUI

@main
struct BaetaverseBusinessApp: App {
    
    var appService: AppService = BaetaverseAppService.configure()
    
    var body: some Scene {
        WindowGroup {
            if appService.isLogin {
                MainView()
            } else {
                LoginView()
            }
        }
    }
}
