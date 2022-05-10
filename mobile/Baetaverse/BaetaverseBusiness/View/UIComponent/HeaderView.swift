//
//  HeaderView.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/10.
//

import SwiftUI

struct HeaderView<Content: View>: View {
    
    private let content: () -> Content
    private let headline: String
    private let subheadline: String
    
    init(headline: String, subheadline: String,
         @ViewBuilder destination content: @escaping () -> Content) {
        self.content = content
        self.headline = headline
        self.subheadline = subheadline
    }
    
    var body: some View {
        VStack {
            Divider()
            HStack {
                VStack(alignment: .leading) {
                    Text(headline)
                        .font(.headline)
                    Text(subheadline)
                        .font(.subheadline)
                        .foregroundColor(.gray)
                }
                Spacer()
                NavigationLink {
                    content()
                } label: {
                    Text("전체보기")
                }

            }
        }
    }
    
}

struct HeaderView_Previews: PreviewProvider {
    
    static var previews: some View {
        HeaderView(headline: "headline title", subheadline: "subheadline title") {
            Text("Hello World")
        }
    }
    
}
