//
//  BaetaverseAPIRequestHostInfo.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/03/29.
//

import Foundation

protocol BaetaverseAPIRequestHostInfo: APIRequestHostInfo { }

extension BaetaverseAPIRequestHostInfo {
    
    var baseURL: String {
        "127.0.0.1:8080"
    }
    
}
