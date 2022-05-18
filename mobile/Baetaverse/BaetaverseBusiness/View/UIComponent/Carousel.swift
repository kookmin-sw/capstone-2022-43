//
//  Carousel.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/02.
//

import SwiftUI

struct Carousel<Content: View>: View {
    
    var content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        TabView {
            content()
        }
        .tabViewStyle(.page(indexDisplayMode: .always))
    }
    
}

struct Carousel_Previews: PreviewProvider {
    
    static var previews: some View {
        Carousel {
            RoundedRectangle(cornerRadius: 20)
            Text("Hello World!")
        }
        .foregroundColor(.gray)
    }
    
}
