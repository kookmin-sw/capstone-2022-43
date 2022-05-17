//
//  EstimatesView.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/17.
//

import SwiftUI

@MainActor
struct EstimatesView: View {
    
    @StateObject private var viewModel = EstimateViewModel()
    
    var body: some View {
        NavigationView {
            EstimatesContentView(viewModel: viewModel)
                .navigationTitle("견적서")
        }
    }
    
}

private struct EstimatesContentView: View {
    
    @ObservedObject var viewModel: EstimateViewModel

    var body: some View {
        List {
            ForEach(viewModel.estimates) { estimate in
                NavigationLink(destination: { EstimatesDetailView(estimates: estimate) }) {
                    EstimatesListCellView(estimate: estimate)
                }
            }
        }
        .task {
            try? await viewModel.fetchEstimates()
        }
        .refreshable {
            try? await viewModel.fetchEstimates()

        }
    }

}

private struct EstimatesListCellView: View {
    
    let estimate: QuotationEntity
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text("제안견적금액 \(estimate.estimate.totalPrice)")
                Text("무역 방식 \(estimate.estimateRequest.tradeType)")
                HStack {
                    Text("출발지 \(estimate.estimateRequest.departureCountry)")
                    Image(systemName: "arrowtriangle.right.fill")
                    Text("도착지 \(estimate.estimateRequest.destinationCountry)")
                }
            }
        }
    }
    
}

struct EstimatesView_Previews: PreviewProvider {
    static var previews: some View {
        EstimatesView()
    }
}
