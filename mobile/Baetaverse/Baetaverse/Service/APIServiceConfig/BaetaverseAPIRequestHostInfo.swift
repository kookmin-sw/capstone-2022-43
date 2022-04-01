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
        "http://54.86.57.172:8080"
    }
    
}
