//
//  RecievedEstimatesView.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/03.
//

import SwiftUI

struct RecievedEstimatesView: View {
    
    @StateObject var viewModel = RecievedEstimatesViewModel()
    
    var body: some View {
        EstimatesListView(estimates: viewModel.estimates)
            .navigationTitle("받은견적요청서")
            .navigationBarTitleDisplayMode(.inline)
    }
    
}

private struct EstimatesListView: View {
    
    var estimates: [EstimateEntity]
    
    var body: some View {
        List {
            ForEach(estimates) { estimate in
                NavigationLink(destination: RecievedEstimateDetailView()) {
                    EstimateCellView(estimate: estimate)
                }
            }
        }
    }
    
}

private struct EstimateCellView: View {
    
    var estimate: EstimateEntity
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("No. \(estimate.id)")
            Text("물품명 \(estimate.itemName)")
            HStack {
                Text("출발지 \(estimate.departure)")
                Image(systemName: "arrowtriangle.right.fill")
                Text("도착지 \(estimate.destination)")
            }
            Text("인코텀즈 \(estimate.incoterms)")
        }
    }
    
}

struct RecievedEstimatesView_Previews: PreviewProvider {
    
    static var previews: some View {
        RecievedEstimatesView()
    }
    
}
