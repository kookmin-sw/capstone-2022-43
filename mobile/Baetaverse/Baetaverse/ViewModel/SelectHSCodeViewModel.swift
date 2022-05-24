//
//  SelectHSCodeViewModel.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/16.
//

import Foundation
import UIKit.UIApplication

final class SelectHSCodeViewModel {
    
    private var appService: AppService? {
        guard let appDelegate = UIApplication.shared.delegate as? AppDelegate else {
            return nil
        }
        return appDelegate.appService
    }
    
    func queryHSCode(with query: String) async throws -> [String] {
        try await appService?.queryHSCode(code: query) ?? []
    }
    
}
