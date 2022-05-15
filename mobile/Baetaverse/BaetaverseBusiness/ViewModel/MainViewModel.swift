//
//  MainViewModel.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/10.
//

import Foundation

final class MainViewModel: ObservableObject {
    
    var username: String {
        "singularis7"
    }
    
    var estimates: [Review] {
        [
            Review(
                id: 1,
                title: "견적서 1번",
                created: Date(),
                rating: 2,
                editor: "한정택",
                reviewText: "견적 내용 작성\n견적 내용 작성\n견적 내용 작성\n견적 내용 작성\n"
            ),
            Review(
                id: 2,
                title: "견적서 2번",
                created: Date(),
                rating: 4,
                editor: "택정한",
                reviewText: "견적 내용 작성\n견적 내용 작성\n견적 내용 작성\n견적 내용 작성\n"
            )
        ]
    }
    
    var reviews: [Review] {
        [
            Review(
                id: 1,
                title: "Hello World1",
                created: Date(),
                rating: 2,
                editor: "한정택",
                reviewText: "그냥 리뷰 남김\n그냥 리뷰 남김\n그냥 리뷰 남김\n그냥 리뷰 남김\n"
            ),
            Review(
                id: 2,
                title: "Hello World2",
                created: Date(),
                rating: 2,
                editor: "택정한",
                reviewText: "그냥 리뷰 남김\n그냥 리뷰 남김\n그냥 리뷰 남김\n그냥 리뷰 남김\n"
            )
        ]
    }
    
}
