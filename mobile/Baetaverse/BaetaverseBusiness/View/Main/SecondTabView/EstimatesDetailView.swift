//
//  EstimatesDetailView.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/17.
//

import SwiftUI

struct EstimatesDetailView: View {
    
    let estimates: QuotationEntity
    
    var body: some View {
        EstimatesDetailContentView(estimates: estimates)
            .navigationTitle("견적서 세부정보")
    }
    
}

private struct EstimatesDetailContentView: View {
    
    let estimates: QuotationEntity
    
    var body: some View {
        VStack {
            Text("견적서 번호: " + String(estimates.estimate.requestId))
            Text("총 소요 비용: " + String(estimates.estimate.totalPrice))
            Text("총 소요 시간: " + String(estimates.estimate.estimatedTime))
            Text("내륙 운송 비용: " + String(estimates.estimate.inlandFreightPrice))
            Text("해상 운송 비용: " + String(estimates.estimate.oceanFreightPrice))
        }
    }
    
}
