//
//  NetworkServiceProvider.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/03/30.
//

import Foundation

protocol NetworkService {
    
    func fetchData(for request: URLRequest) async throws -> Data
    func fetchData(for service: APIService) async throws -> Data
    
}

struct NetworkServiceProvider: NetworkService {
    
    private var session: URLSession {
        URLSession.shared
    }
    
    func fetchData(for request: URLRequest) async throws -> Data {
        let (data, response) = try await session.data(for: request)
        
        guard let httpResponse = response as? HTTPURLResponse else {
            throw NetworkServiceError.invalidHTTPResponse
        }
        
        switch httpResponse.statusCode {
        case let code where (400...499).contains(code):
            throw NetworkServiceError.requestError
        case let code where (500...599).contains(code):
            throw NetworkServiceError.serverError
        default:
            return data
        }
    }
    
    func fetchData(for service: APIService) async throws -> Data {
        guard let request = service.urlRequest else {
            throw NetworkServiceError.invalidURLRequest
        }
        let data = try await fetchData(for: request)
        return data
    }
    
    enum NetworkServiceError: Error {
        
        case requestError
        case serverError
        case invalidHTTPResponse
        case invalidURLRequest
        
    }
    
}
