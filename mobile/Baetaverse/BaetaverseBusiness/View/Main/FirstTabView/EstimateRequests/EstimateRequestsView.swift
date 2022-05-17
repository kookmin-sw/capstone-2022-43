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
    @State private var registerSheetIsPresented = false
    
    var body: some View {
        EstimatesContentView(
            viewModel: viewModel,
            formIsPresented: $registerSheetIsPresented
        )
        .navigationTitle("견적 요청서")
        .sheet(isPresented: $registerSheetIsPresented) {
            RegisterEstimatesView()
        }
    }
    
}

private struct EstimatesContentView: View {
    
    @ObservedObject var viewModel: EstimateRequestsViewModel
    @Binding var formIsPresented: Bool
    
    var body: some View {
        List {
            ForEach(viewModel.estimatesRequests) { estimateRequest in
                Button(action: { formIsPresented.toggle() }) {
                    EstimatesListCellView(estimateRequest: estimateRequest)
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
