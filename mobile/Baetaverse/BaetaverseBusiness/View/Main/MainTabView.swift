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
            MainView().tabItem { Text("메인") }
            Text("Tab Content 2").tabItem { Text("보낸견적서") }
            Text("Tab Content 2").tabItem { Text("상담내역") }
        }
    }
    
}

fileprivate struct MainView_Previews: PreviewProvider {
    
    static var previews: some View {
        MainTabView()
            .previewInterfaceOrientation(.portrait)
    }
    
}
