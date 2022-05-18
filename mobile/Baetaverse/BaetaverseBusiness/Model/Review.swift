//
//  Review.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/02.
//

import Foundation

struct Review: Identifiable {
    
    var id: Int
    var title: String = ""
    var created: Date = Date()
    var rating: Int = 0
    var editor: String = ""
    var reviewText: String = ""
    
}
