//
//  RecievedEstimatesViewModel.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/03.
//

import Foundation

final class RecievedEstimatesViewModel: ObservableObject {
    
    private(set) var estimates = [
        EstimateEntity(
            id: 1,
            itemName: "맥북 프로 14인치",
            departure: "대한민국",
            destination: "중국",
            incoterms: "ABC"
        ),
        EstimateEntity(
            id: 2,
            itemName: "아이폰 13 프로 맥스",
            departure: "대한민국",
            destination: "중국",
            incoterms: "DEF"
        ),
        EstimateEntity(
            id: 3,
            itemName: "아이패드 프로 12.9",
            departure: "대한민국",
            destination: "중국",
            incoterms: "GHI"
        ),
        EstimateEntity(
            id: 4,
            itemName: "아이패드 미니",
            departure: "대한민국",
            destination: "중국",
            incoterms: "JKL"
        )
    ]
    
}
