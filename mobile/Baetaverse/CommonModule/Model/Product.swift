//
//  Product.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/12.
//

import Foundation

struct Product: Identifiable {
    
    var id: Int?
    var name: String
    var price: Int
    var weight: Int
    var standardUnit: String
    var hsCode: String
    var createdAt: Date?
    
}

extension Product {
    
    init(goods: APIEntity.GoodsDetail) {
        self.id = goods.id
        self.name = goods.name
        self.price = goods.price
        self.weight = goods.weight
        self.standardUnit = goods.standardUnit
        self.hsCode = goods.hscode
        self.createdAt = goods.createdAt
    }
    
    init() {
        self.id = nil
        self.name = ""
        self.price = 0
        self.weight = 0
        self.standardUnit = ""
        self.hsCode = ""
        self.createdAt = nil
    }
    
}
