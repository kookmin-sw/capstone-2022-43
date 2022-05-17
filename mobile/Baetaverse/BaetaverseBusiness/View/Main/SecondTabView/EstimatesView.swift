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
            ForEach(viewModel.estimatesRequests) { data in
                VStack {
                    Text(data.tradeType)
                    Text(data.closingDate.formatted())
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

struct EstimatesView_Previews: PreviewProvider {
    
    static var previews: some View {
        EstimatesView()
    }
    
}
