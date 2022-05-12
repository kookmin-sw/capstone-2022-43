//
//  BusinessService.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/09.
//

import Foundation

protocol BusinessService {
    
    func registerEvaluate(id: String, HSCode: String, country: String) async throws
    func fetchEvaluates() async throws -> [Estimate]
    func queryHSCode(code: String) async throws -> [String]
    
}
