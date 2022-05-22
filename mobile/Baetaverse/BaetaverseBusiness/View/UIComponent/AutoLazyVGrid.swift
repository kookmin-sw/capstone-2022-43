//
//  AutoLazyVGrid.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/10.
//

import SwiftUI

struct AutoLazyVGrid<Content: View>: View {
    
    private var content: () -> Content
    private let columns: [GridItem]
    private let spacing: CGFloat?
    private let alignment: HorizontalAlignment
    
    init(column: Int, spacing: CGFloat? = nil,
         alignment: HorizontalAlignment = .center,
         @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.columns = Array(repeating: GridItem(), count: column)
        self.spacing = spacing
        self.alignment = alignment
    }
    
    var body: some View {
        LazyVGrid(columns: columns, alignment: alignment, spacing: spacing) {
            content()
        }
    }
    
}

struct AutoVGrid_Previews: PreviewProvider {
    
    static var previews: some View {
        AutoLazyVGrid(column: 3) {
            Text("Hello World")
            Text("Hello World")
            Text("Hello World")
            Text("Hello World")
        }
    }
    
}
