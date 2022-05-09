//
//  AppService.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/04/01.
//

import Foundation

protocol AppService: Auth {
    
    func registerEvaluate(id: String, HSCode: String, country: String) async throws
    func fetchEvaluates() async throws -> [Estimate]
    
}
