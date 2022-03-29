//
//  APIRequest.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/03/29.
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

extension APIRequest {
    
    var compositePath: String {
        baseURL + path
    }
    
    var urlComponents: URLComponents? {
        var components = URLComponents(string: compositePath)
        components?.queryItems = query.map { URLQueryItem(name: $0, value: $1) }
        return components
    }
    
    var url: URL? {
        urlComponents?.url
    }
    
    var urlRequest: URLRequest? {
        guard let url = url else { return nil }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.stringValue
        headers.forEach { urlRequest.setValue($1, forHTTPHeaderField: $0) }
        
        return urlRequest
    }
    
}

extension APIRequestGET {
    
    var httpMethod: HTTPMethod {
        .get
    }
    
    var query: [String: String] {
        parameters
    }
    
}

extension APIRequestPOST {
    
    var httpMethod: HTTPMethod {
        .post
    }
    
    var urlRequest: URLRequest? {
        guard let url = url else { return nil }
        
        var urlRequest = URLRequest(url: url)
        urlRequest.httpMethod = httpMethod.stringValue
        headers.forEach { urlRequest.setValue($1, forHTTPHeaderField: $0) }
        urlRequest.setValue(contentType, forHTTPHeaderField: "Content-Type")
        urlRequest.httpBody = body
        
        return urlRequest
    }
}
