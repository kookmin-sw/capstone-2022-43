//
//  Extensions+Locale.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/14.
//

import Foundation

extension Locale {
    
    static var localizedCountryNames: [String] {
        Locale.isoRegionCodes
            .map({ Locale.current.localizedString(forRegionCode: $0)})
            .compactMap({ $0 })
    }
    
}
