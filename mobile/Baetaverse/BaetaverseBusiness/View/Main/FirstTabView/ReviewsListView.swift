//
//  ReviewsListView.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/18.
//

import SwiftUI

@MainActor
struct ReviewsListView: View {
    
    @StateObject var viewModel = MainViewModel()
    
    var body: some View {
        List {
            ForEach(viewModel.reviews) { review in
                ReviewCardView(review: .constant(review))
            }
            .navigationTitle("받은리뷰명단")
        }
        .task {
            try? await viewModel.fetchReviews()
        }
        .refreshable {
            try? await viewModel.fetchReviews()
        }
    }
    
}

struct ReviewsListView_Previews: PreviewProvider {
    
    static var previews: some View {
        ReviewsListView()
    }
    
}
