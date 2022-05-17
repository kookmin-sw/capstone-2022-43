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
        VStack(alignment: .leading, spacing: 20) {
            Group {
                Text("견적서코드")
                    .font(.title)
                Text(String(estimates.estimate.requestId))
                    .font(.title2)
            }
            Divider()
            Group {
                Text("내륙 운송 비용")
                    .font(.title)
                Text(String(estimates.estimate.inlandFreightPrice))
                    .font(.title2)
                Text("해상 운송 비용")
                    .font(.title)
                Text(String(estimates.estimate.oceanFreightPrice))
                    .font(.title2)
            }
            Divider()
            Group {
                Text("총 소요 비용")
                    .font(.title)
                Text(String(estimates.estimate.totalPrice))
                    .font(.title2)
                Text("총 소요 시간")
                    .font(.title)
                Text(String(estimates.estimate.estimatedTime))
                    .font(.title2)
            }
        }
        .padding()
    }
    
}
