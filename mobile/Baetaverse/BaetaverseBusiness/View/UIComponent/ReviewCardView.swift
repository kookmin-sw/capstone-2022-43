//
//  ReviewCardView.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/02.
//

import SwiftUI

struct ReviewCardView: View {
    
    @Binding var review: ReviewEntity
    
    var body: some View {
        CardView {
            VStack {
                ReviewCardTitleView(title: $review.reviewText, created: $review.created)
                ReviewCardHeaderView(rating: $review.rating, editor: $review.owner)
            }
            ReviewCardContentView(reviewText: $review.reviewText)
        }
    }
    
}

private struct ReviewCardTitleView: View {
    
    @Binding var title: String
    @Binding var created: Date
    
    var body: some View {
        HStack {
            Text(title)
            Spacer()
            Text(created.formatted())
        }
    }
    
}

private struct ReviewCardHeaderView: View {
    
    @Binding var rating: Int
    @Binding var editor: String
    
    var body: some View {
        HStack {
            StarRatingView(rating: $rating)
            Spacer()
            Text(editor)
        }
    }
    
}

private struct ReviewCardContentView: View {
    
    @Binding var reviewText: String
    
    var body: some View {
        Text(reviewText)
            .lineLimit(3)
    }
    
}
