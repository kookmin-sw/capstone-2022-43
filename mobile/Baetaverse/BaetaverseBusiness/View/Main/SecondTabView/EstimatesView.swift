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
                Text("\(estimate.estimate.totalPrice)")
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

struct EstimatesView_Previews: PreviewProvider {
    static var previews: some View {
        EstimatesView()
    }
}
