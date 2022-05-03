//
//  MainView.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/03.
//

import SwiftUI

struct MainView: View {
    
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

fileprivate struct RecievedReviewCollectionView: View {
    
    var body: some View {
        VStack {
            Text("받은리뷰: 몇건")
            Text("평점: 몇점")
            Divider()
        }
    }
    
}

fileprivate struct ShortcutButtonsView: View {
    
    var body: some View {
        HStack {
            Spacer()
            RecievedQuotationButton()
            Divider()
            ConsultationRequestButton()
            Spacer()
        }
    }
    
}

fileprivate struct RecievedQuotationButton: View {
    
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

fileprivate struct ConsultationRequestButton: View {
    
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

fileprivate struct MainView_Previews: PreviewProvider {
    
    static var previews: some View {
        MainView()
    }
    
}
