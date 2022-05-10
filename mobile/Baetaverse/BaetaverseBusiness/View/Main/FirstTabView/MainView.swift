//
//  MainView.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/03.
//

import SwiftUI

struct MainView: View {
    
    var body: some View {
        NavigationView {
            ScrollView {
                MainContentView()
            }
            .navigationTitle("BAETAVERSE")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
}

private struct MainContentView: View {
    
    var body: some View {
        VStack(alignment: .leading, spacing: 20) {
            MainWelcomeMessageView(username: .constant("포워더"))
            MainShortcutButtonsView()
            Divider()
            MainRecievedReviewBoardView()
            MainEstimateBoardView()
        }
        .padding()
    }
    
}

private struct MainWelcomeMessageView: View {
    
    @Binding var username: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Spacer()
            Text("\(username) 고객님")
                .font(.largeTitle)
            Text("배타버스에 오신 것을 환영합니다 ☺️")
                .font(.title2)
        }
    }
    
}

private struct MainShortcutButtonsView: View {
    
    var body: some View {
        VStack(alignment: .leading,spacing: 20) {
            Text("Title")
            AutoLazyHGrid(row: 1) {
                RecievedQuotationButton()
                ConsultationRequestButton()
            }
            .font(.title)
            .buttonStyle(.bordered)
        }
    }
    
}

private struct MainRecievedReviewBoardView: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            VStack(alignment: .leading) {
                MainReviewCountingView()
                MainReviewStarRatingView()
            }
            .font(.title)
            VStack {
                MainReviewCarouselView()
            }
        }
    }
    
}

private struct MainEstimateBoardView: View {
    
    private let review = Review(
        title: "견적서 1번",
        created: Date(),
        rating: 2,
        editor: "한정택",
        reviewText: "견적 내용 작성\n견적 내용 작성\n견적 내용 작성\n견적 내용 작성\n"
    )
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("마감임박견적요청서")
                .font(.title)
            Carousel {
                ReviewCardView(review: .constant(review))
                ReviewCardView(review: .constant(review))
                ReviewCardView(review: .constant(review))
            }
            .frame(height: 150)
        }
    }
    
}

private struct RecievedQuotationButton: View {
    
    var body: some View {
        NavigationLink(destination: RecievedEstimatesView()) {
            VStack {
                Text("견적 요청 내역")
                Image(systemName: "doc.text")
            }
        }
    }
    
}

private struct ConsultationRequestButton: View {
    
    var body: some View {
        NavigationLink(destination: ConsultationView()) {
            VStack {
                Text("상담 요청 내역")
                Image(systemName: "exclamationmark.bubble")
            }
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
    
    private let review = Review(
        title: "Hello World",
        created: Date(),
        rating: 2,
        editor: "한정택",
        reviewText: "그냥 리뷰 남김\n그냥 리뷰 남김\n그냥 리뷰 남김\n그냥 리뷰 남김\n"
    )
    
    var body: some View {
        Carousel {
            ReviewCardView(review: .constant(review))
            ReviewCardView(review: .constant(review))
            ReviewCardView(review: .constant(review))
        }
        .frame(height: 150)
    }
    
}

struct MainView_Previews: PreviewProvider {
    
    static var previews: some View {
        MainView()
    }
    
}
