//
//  GoodsRegister.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/13.
//

import Foundation

extension APIEntity {
    
    struct GoodsRegister: Encodable {
        
        let name: String
        let price: Int
        let weight: Int
        let standardUnit: String
        let hscode: String
        
        enum CodingKeys: String, CodingKey {
            
            case name
            case price
            case weight
            case standardUnit = "standard_unit"
            case hscode
            
        }
        
    }
    
}

extension APIEntity.GoodsRegister {
    
    init(product: Product) {
        self.name = product.name
        self.price = product.price
        self.weight = product.weight
        self.standardUnit = product.standardUnit
        self.hscode = product.hsCode
    }
    
}
