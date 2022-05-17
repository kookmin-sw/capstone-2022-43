//
//  EstimatesView.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/10.
//

import SwiftUI

@MainActor
struct EstimatesView: View {
    
    @StateObject var viewModel = EstimatesViewModel()
    
    var body: some View {
        NavigationView {
            EstimatesContentView(viewModel: viewModel)
                .navigationTitle("견적서요청서")
        }
    }
    
}

private struct EstimatesContentView: View {
    
    @ObservedObject var viewModel: EstimatesViewModel
    
    var body: some View {
        List {
            ForEach(viewModel.estimatesRequests) { estimateRequest in
                EstimatesListCellView(estimateRequest: estimateRequest)
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

struct EstimatesView_Previews: PreviewProvider {
    
    static var previews: some View {
        EstimatesView()
    }
    
}
