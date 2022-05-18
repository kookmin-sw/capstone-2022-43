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
        List {
            Section("견적 요청서의 세부정보를 조회합니다") {
                NavigationLink(destination: List {
                    EstimateRequestsDetailView(id: estimates.estimateRequest.id ?? 0)
                }) {
                    HStack {
                        Text("견적서 정보 조회하기").font(.body)
                    }
                }
            }
            Section("운송 비용 세부 항목을 확인합니다.") {
                HStack {
                    Text("내륙 운송 비용").font(.body)
                    Spacer()
                    Text(String(estimates.estimate.inlandFreightPrice)).font(.caption)
                }
                HStack {
                    Text("해상 운송 비용").font(.body)
                    Spacer()
                    Text(String(estimates.estimate.oceanFreightPrice)).font(.caption)
                }
            }
            Section("예상되는 총 운송 비용을 확인합니다.") {
                HStack {
                    Text("총 소요 비용").font(.body)
                    Spacer()
                    Text(String(estimates.estimate.totalPrice)).font(.caption)
                }
                HStack {
                    Text("총 소요 시간").font(.body)
                    Spacer()
                    Text(String(estimates.estimate.estimatedTime)).font(.caption)
                }
            }
        }
    }
    
}
