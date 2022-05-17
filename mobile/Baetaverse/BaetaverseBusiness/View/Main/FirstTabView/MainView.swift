//
//  MainView.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/03.
//

import SwiftUI

struct MainView: View {
    
    @StateObject private var viewModel = MainViewModel()
    
    var body: some View {
        NavigationView {
            ScrollView {
                MainContentView(viewModel: viewModel)
            }
            .navigationTitle("BAETAVERSE")
        }
    }
    
}

private struct MainContentView: View {
    
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            MainWelcomeMessageView()
            //            MainShortcutButtonsView()
            MainEstimateBoardView(viewModel: viewModel)
            MainRecievedReviewBoardView(reviews: viewModel.reviews)
        }
        .padding()
    }
    
}

private struct MainWelcomeMessageView: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("고객님")
                .font(.largeTitle)
            Text("배타버스에 오신 것을 환영합니다 ☺️")
                .font(.title2)
        }
    }
    
}

private struct MainShortcutButtonsView: View {
    
    var body: some View {
        VStack(alignment: .center, spacing: 10) {
            HeaderView(
                headline: "Popular Features",
                subheadline: "배타버스의 대표기능을 사용해보세요!") {
                    Text("Hello World")
                }
            AutoLazyHGrid(row: 1, spacing: 25) {
                RecievedQuotationButton()
                ConsultationRequestButton()
            }
            .font(.title2)
            .buttonStyle(.borderedProminent)
        }
    }
    
}

private struct MainRecievedReviewBoardView: View {
    
    let reviews: [Review]
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HeaderView(
                headline: "User's Reviews",
                subheadline: "이용자의 피드백을 확인해보세요!") {
                    Text("Hello World")
                }
            VStack(alignment: .leading) {
                MainReviewCountingView()
                MainReviewStarRatingView()
            }
            .font(.title2)
            MainReviewCarouselView(reviews: reviews)
        }
    }
    
}

private struct MainEstimateBoardView: View {
    
    @ObservedObject var viewModel: MainViewModel
    
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HeaderView(
                headline: "Estimate Requests",
                subheadline: "마감이 임박한 견적요청서를 확인해보세요!") {
                    EstimateRequestsView()
                }
            if !$viewModel.estimateRequests.isEmpty {
                Carousel {
                    ForEach($viewModel.estimateRequests) { estimate in
                        EstimateRequestCardView(estimateRequest: estimate)
                    }
                }
                .frame(height: 130)
            }
        }
        .task {
            try? await viewModel.fetchEstimateRequests()
        }
    }
    
}

private struct RecievedQuotationButton: View {
    
    var body: some View {
        NavigationLink(destination: RecievedEstimatesView()) {
            Label("견적 요청 내역", systemImage: "doc.text")
        }
    }
    
}

private struct ConsultationRequestButton: View {
    
    var body: some View {
        NavigationLink(destination: ConsultationView()) {
            Label("상담 요청 내역", systemImage: "exclamationmark.bubble")
        }
    }
    
}

private struct MainReviewCountingView: View {
    
    var body: some View {
        Text("받은리뷰: 7건")
    }
    
}

private struct MainReviewStarRatingView: View {
    
    var body: some View {
        HStack {
            Text("평점")
            StarRatingView(rating: .constant(4))
        }
    }
    
}

private struct MainReviewCarouselView: View {
    
    let reviews: [Review]
    
    var body: some View {
        Carousel {
            ForEach(reviews) { review in
                ReviewCardView(review: .constant(review))
            }
        }
        .frame(height: 150)
    }
    
}

struct MainView_Previews: PreviewProvider {
    
    static var previews: some View {
        MainView()
    }
    
}
