//
//  NetworkService.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/04/01.
//

import Foundation

protocol NetworkService {
    
    func fetchData(for request: URLRequest) async throws -> Data
    func fetchData(for service: APIService) async throws -> Data
    
}
