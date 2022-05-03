//
//  CardView.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/02.
//

import SwiftUI

struct CardView<Content: View>: View {
    
    var content: () -> Content
    
    init(@ViewBuilder content: @escaping () -> Content) {
        self.content = content
    }
    
    var body: some View {
        VStack(alignment: .leading, spacing: 8) {
            content()
        }
        .padding()
        .background(RoundedRectangle(cornerRadius: 8).foregroundColor(.secondary))
    }
    
}

fileprivate struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        CardView {
            Text("Hello World")
        }
    }
}
