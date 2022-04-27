//
//  BusinessService.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/04/01.
//

import Foundation

protocol BusinessService {
    
    func registerEvaluate(token: String, id: String, HSCode: String, country: String) async throws
    
}
