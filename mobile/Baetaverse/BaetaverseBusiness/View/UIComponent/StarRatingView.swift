//
//  StarRatingView.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/02.
//

import SwiftUI

struct StarRatingView: View {
    
    @Binding var rating: Int
    
    var maximumRating = 5
    var label: String?
    
    let offImage = Image(systemName: "star")
    let onImage = Image(systemName: "star.fill")
    
    let offColor = Color.gray
    let onColor = Color.yellow
    
    var body: some View {
        HStack {
            if let label = label {
                Text(label)
            }
            
            ForEach(1...maximumRating, id: \.self) { number in
                image(for: number)
                    .foregroundColor(number > rating ? offColor : onColor)
                    .onTapGesture {
                        rating = number
                    }
            }
        }
    }
    
    func image(for number: Int) -> Image {
        return number > rating ? offImage : onImage
    }
    
}

struct StarRatingView_Previews: PreviewProvider {
    
    static var previews: some View {
        StarRatingView(rating: .constant(5))
    }
    
}
