//
//  EstimateRequestsView.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/10.
//

import SwiftUI

@MainActor
struct EstimateRequestsView: View {
    
    @StateObject var viewModel = EstimateRequestsViewModel()
    
    var body: some View {
        EstimatesContentView(viewModel: viewModel)
            .navigationTitle("견적 요청서")
    }
    
}

private struct EstimatesContentView: View {
    
    @ObservedObject var viewModel: EstimateRequestsViewModel
    @State private var registerSheetIsPresented = false
    
    var body: some View {
        List {
            ForEach(viewModel.estimatesRequests) { estimateRequest in
                Button(action: { registerSheetIsPresented.toggle() }) {
                    EstimatesListCellView(estimateRequest: estimateRequest)
                }
                .sheet(isPresented: $registerSheetIsPresented) {
                    NavigationView {
                        List {
                            EstimateRequestsDetailView(id: estimateRequest.id ?? 0)
                            Section("견적 요청서에 대한 견적서를 등록합니다.") {
                                NavigationLink {
                                    RegisterEstimatesView(id: estimateRequest.id ?? 0)
                                } label: {
                                    Text("견적 정보 등록하기")
                                }
                            }
                        }
                        .toolbar {
                            ToolbarItem(placement: .navigationBarTrailing) {
                                Button(role: .cancel, action: { registerSheetIsPresented.toggle() }) {
                                    Text("닫기")
                                }
                            }
                        }
                    }
                }
            }
        }
        .task {
            try? await viewModel.queryAllEstimatesRequests()
        }
        .refreshable {
            try? await viewModel.queryAllEstimatesRequests()
        }
    }
    
}

private struct EstimatesListCellView: View {
    
    let estimateRequest: EstimateRequest
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("마감일 \(estimateRequest.closingDate.formatted())")
            Text("무역 방식 \(estimateRequest.tradeType)")
            HStack {
                Text("출발지 \(estimateRequest.departureCountry)")
                Image(systemName: "arrowtriangle.right.fill")
                Text("도착지 \(estimateRequest.destinationCountry)")
            }
        }
    }
    
}

struct EstimateRequestsView_Previews: PreviewProvider {
    
    static var previews: some View {
        EstimateRequestsView()
    }
    
}
