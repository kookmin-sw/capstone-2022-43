//
//  AutoLazyHGrid.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/10.
//

import SwiftUI

struct AutoLazyHGrid<Content: View>: View {
    
    private var content: () -> Content
    private let rows: [GridItem]
    private let spacing: CGFloat?
    private let alignment: VerticalAlignment
    
    init(row: Int, spacing: CGFloat? = nil,
         alignment: VerticalAlignment = .center,
         @ViewBuilder content: @escaping () -> Content) {
        self.content = content
        self.rows = Array(repeating: GridItem(), count: row)
        self.spacing = spacing
        self.alignment = alignment
    }
    
    var body: some View {
        LazyHGrid(rows: rows, alignment: alignment, spacing: spacing) {
            content()
        }
    }
    
}

struct AutoLazyHGrid_Previews: PreviewProvider {
    
    static var previews: some View {
        AutoLazyHGrid(row: 3) {
            Text("Hello World")
            Text("Hello World")
            Text("Hello World")
            Text("Hello World")
        }
    }
    
}
