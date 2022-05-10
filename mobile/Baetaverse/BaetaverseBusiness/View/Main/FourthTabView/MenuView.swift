//
//  MoreView.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/05.
//

import SwiftUI

struct MoreView: View {
    
    var body: some View {
        NavigationView {
            MoreContentView()
                .navigationTitle(Text("더보기"))
        }
    }
    
}

private struct MoreContentView: View {
    
    var body: some View {
        List {
            NavigationLink(destination: Text("Hello World")) {
                Text("마이페이지")
            }
            NavigationLink(destination: Text("Hello World")) {
                Text("받은견적요청서")
            }
            NavigationLink(destination: Text("Hello World")) {
                Text("상담내역")
            }
            NavigationLink(destination: Text("Hello World")) {
                Text("고객센터")
            }
        }
    }
    
}

struct MoreView_Previews: PreviewProvider {
    
    static var previews: some View {
        MoreView()
    }
    
}
