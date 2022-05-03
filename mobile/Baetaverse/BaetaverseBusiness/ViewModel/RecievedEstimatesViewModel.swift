//
//  RecievedEstimatesViewModel.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/03.
//

import Foundation

final class RecievedEstimatesViewModel: ObservableObject {
    
    private(set) var estimates = [
        Estimate(
            id: 1,
            productName: "맥북 프로 14인치",
            departure: "대한민국",
            destination: "중국",
            incoterms: "ABC"
        ),
        Estimate(
            id: 2,
            productName: "아이폰 13 프로 맥스",
            departure: "대한민국",
            destination: "중국",
            incoterms: "DEF"
        ),
        Estimate(
            id: 3,
            productName: "아이패드 프로 12.9",
            departure: "대한민국",
            destination: "중국",
            incoterms: "GHI"
        ),
        Estimate(
            id: 4,
            productName: "아이패드 미니",
            departure: "대한민국",
            destination: "중국",
            incoterms: "JKL"
        )
    ]
    
}
