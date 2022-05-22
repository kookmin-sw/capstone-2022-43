//
//  Extensions+Encodable.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/04/27.
//

import Foundation

extension Encodable {
    
    func encodeToJSONData() throws -> Data {
        let encoder = JSONEncoder()
        encoder.outputFormatting = .prettyPrinted
        encoder.dateEncodingStrategy = .secondsSince1970
        let jsonData = try encoder.encode(self)
        return jsonData
    }
    
}
