//
//  SelectRegionViewModel.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/14.
//

import Foundation

final class SelectRegionViewModel {
    
    private(set) var countries: [String] = [
        "China",
        "Japan",
        "South Korea",
        "UnitedStates"
    ]
    
    var alphabetIndex: [Character: [String]] {
        countries.reduce([Character: [String]]()) { partialResult, countryName in
            guard let alphabetIndex = countryName.capitalized.first else {
                return partialResult
            }
            
            var dict = partialResult
            
            if let existValue = partialResult[alphabetIndex] {
                dict.updateValue(existValue + [countryName], forKey: alphabetIndex)
            } else {
                dict[alphabetIndex] = [countryName]
            }
            
            return dict
        }
    }
    
}
