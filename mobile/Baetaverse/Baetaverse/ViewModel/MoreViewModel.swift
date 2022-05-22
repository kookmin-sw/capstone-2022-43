//
//  MoreViewModel.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/17.
//

import Foundation
import UIKit.UIApplication

final class MoreViewModel {
    
    private var appService: AppService? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        return appDelegate.appService
    }
    
    func logout() {
        appService?.logout()
    }
    
}
