//
//  MenuViewModel.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/17.
//

import Foundation

final class MenuViewModel: ObservableObject {
    
    private var appService: AppService {
        BaetaverseBusinessApp.appService
    }
    
    func logout() {
        appService.logout()
    }
    
}
