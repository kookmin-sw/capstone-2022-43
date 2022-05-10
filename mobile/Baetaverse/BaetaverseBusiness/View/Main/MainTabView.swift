//
//  MainTabView.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/02.
//

import SwiftUI

struct MainTabView: View {
    
    var body: some View {
        TabView {
            MainView().tabItem {
                Label("메인", systemImage: "house")
            }
            Text("Tab Content 2").tabItem {
                Label("견적서", systemImage: "doc.text")
            }
            ConsultationView().tabItem {
                Label("상담", systemImage: "message.fill")
            }
            MoreView().tabItem {
                Label("더보기", systemImage: "ellipsis")
            }
        }
    }
    
}

struct MainTabView_Previews: PreviewProvider {
    
    static var previews: some View {
        MainTabView()
            .previewInterfaceOrientation(.portrait)
    }
    
}
