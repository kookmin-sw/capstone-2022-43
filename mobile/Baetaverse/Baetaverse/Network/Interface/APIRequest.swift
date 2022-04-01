//
//  APIRequest.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/04/01.
//

import Foundation

protocol APIRequest {
    
    var httpMethod: HTTPMethod { get }
    var baseURL: String { get }
    var path: String { get }
    var query: [String: String] { get }
    var headers: [String: String] { get }
    
}

protocol APIRequestGET: APIRequest {
    
    var parameters: [String: String] { get }
    
}

protocol APIRequestPOST: APIRequest {
    
    var contentType: String { get }
    var body: Data? { get }
    
}
