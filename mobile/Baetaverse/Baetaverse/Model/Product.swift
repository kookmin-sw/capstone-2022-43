//
//  Product.swift
//  Baetaverse
//
//  Created by JeongTaek Han on 2022/05/12.
//

import Foundation

struct Product: Identifiable {
    
    let id: Int?
    let name: String
    let price: Int
    let weight: Int
    let standardUnit: String
    let hsCode: String
    let createdAt: Date
    
}
