//
//  MainView.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/02.
//

import SwiftUI

struct MainView: View {
    var body: some View {
        TabView {
            MainOverView().tabItem { Text("메인") }
            Text("Tab Content 2").tabItem { Text("보낸견적서") }
            Text("Tab Content 2").tabItem { Text("상담내역") }
        }
    }
}

struct MainOverView: View {
    
    var body: some View {
        NavigationView {
            VStack {
                ShortcutButtonsView()
                RecievedReviewCollectionView()
            }
            .navigationTitle("BAETAVERSE")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
    
}

struct RecievedReviewCollectionView: View {
    
    var body: some View {
        VStack {
            Text("받은리뷰: 몇건")
            Text("평점: 몇점")
            
            ScrollView {
                HStack {
                    ReviewCardView()
                }
            }
            
            
        }
    }
    
}



struct ReviewCardView: View {
    
    var body: some View {
        VStack {
            Text("리뷰가 블라블라")
        }
    }
    
}

struct ShortcutButtonsView: View {
    
    var body: some View {
        HStack(alignment: .center, spacing: 20) {
            RecievedQuotationButton()
            ConsultationRequestButton()
        }
    }
    
}

struct RecievedQuotationButton: View {
    
    var body: some View {
        NavigationLink(destination: Text("Hello World")) {
            VStack {
                Text("견적 요청 내역")
                Image(systemName: "doc.text")
            }
        }
        .font(.largeTitle)
        .buttonStyle(.bordered)
    }
    
}

struct ConsultationRequestButton: View {
    
    var body: some View {
        NavigationLink(destination: Text("Hello World")) {
            VStack {
                Text("상담 요청 내역")
                Image(systemName: "exclamationmark.bubble")
            }
        }
        .font(.largeTitle)
        .buttonStyle(.bordered)
    }
    
}

struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
            .previewInterfaceOrientation(.portrait)
    }
}
