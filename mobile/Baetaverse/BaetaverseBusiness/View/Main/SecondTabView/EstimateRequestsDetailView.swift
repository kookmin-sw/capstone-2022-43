//
//  EstimateRequestsDetailView.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/18.
//

import SwiftUI

@MainActor
struct EstimateRequestsDetailView: View {
    
    let id: Int
    
    @StateObject private var viewModel = EstimateRequestsDetailViewModel()
    
    var body: some View {
        EstimateRequestsDetailContentView(viewModel: viewModel)
            .navigationTitle("견적요청서 세부 정보")
            .task {
                try? await viewModel.fetchEstimateRequestDetail(id: id)
            }
            .refreshable {
                try? await viewModel.fetchEstimateRequestDetail(id: id)
            }
    }
    
}

private struct EstimateRequestsDetailContentView: View {
    
    @ObservedObject var viewModel: EstimateRequestsDetailViewModel
    
    var body: some View {
        Section("무역 정보를 안내합니다.") {
            HStack {
                Text("무역 타입").font(.body)
                Spacer()
                Text(String(viewModel.estimateRequest.tradeType)).font(.caption)
            }
            HStack {
                Text("무역 방식").font(.body)
                Spacer()
                Text(String(viewModel.estimateRequest.tradeDetail)).font(.caption)
            }
            HStack {
                Text("인코텀즈 정보").font(.body)
                Spacer()
                Text(String(viewModel.estimateRequest.incoterms)).font(.caption)
            }
        }
        Section("출발지 정보를 안내합니다.") {
            HStack {
                Text("국가").font(.body)
                Spacer()
                let country = String(viewModel.estimateRequest.departureCountry)
                Text(Locale.current.localizedString(forRegionCode: country) ?? country).font(.caption)
            }
            HStack {
                Text("세부주소").font(.body)
                Spacer()
                Text(String(viewModel.estimateRequest.tradeDetail)).font(.caption)
            }
        }
        Section("도착지 정보를 안내합니다.") {
            HStack {
                Text("국가").font(.body)
                Spacer()
                let country = String(viewModel.estimateRequest.destinationCountry)
                Text(Locale.current.localizedString(forRegionCode: country) ?? country).font(.caption)
            }
            HStack {
                Text("세부주소").font(.body)
                Spacer()
                Text(String(viewModel.estimateRequest.destinationDetail)).font(.caption)
            }
        }
        Section("일정 정보를 안내합니다.") {
            HStack {
                Text("견적요청마감일").font(.body)
                Spacer()
                Text(viewModel.estimateRequest.closingDate.formatted()).font(.caption)
            }
            HStack {
                Text("운송요청일").font(.body)
                Spacer()
                Text(String(viewModel.estimateRequest.forwardingDate.formatted())).font(.caption)
            }
        }
    }
    
}

struct EstimateRequestsDetailView_Previews: PreviewProvider {
    static var previews: some View {
        EstimateRequestsDetailView(id: 2)
    }
}
