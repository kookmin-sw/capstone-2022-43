//
//  AppBusinessService.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/04/01.
//

import Foundation

protocol AppBusinessService {
    
    func registerEvaluate(token: String, id: String, HSCode: String, country: String) async throws
    func fetchEvaluates(token: String) async throws -> [Estimate]
    
}
