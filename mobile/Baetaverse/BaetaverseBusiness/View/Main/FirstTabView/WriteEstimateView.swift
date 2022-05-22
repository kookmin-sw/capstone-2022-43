//
//  WriteEstimateView.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/05.
//

import SwiftUI

struct WriteEstimateView: View {
    
    var body: some View {
        WriteEstimateContentView()
            .navigationTitle("견적서보내기")
            .navigationBarTitleDisplayMode(.inline)
    }
    
}

private struct WriteEstimateContentView: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            WriteEstimateFormView()
            Spacer()
            WriteEstimateWarningMessgageView()
            Spacer()
            WriteEstimateButtonsView()
        }
        .padding()
    }
    
}

private struct WriteEstimateFormView: View {
    
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Text("예상해상운임")
                TextField(text: .constant("금액"), prompt: Text("예상해상운임")) {
                    Text("예상해상운임")
                }
            }
            HStack {
                Text("예상내륙운임")
                TextField(text: .constant("금액"), prompt: Text("예상내륙운임")) {
                    Text("예상내륙운임")
                }
            }
            HStack {
                Text("총물류비용")
                TextField(text: .constant("금액"), prompt: Text("총물류비용")) {
                    Text("총물류비용")
                }
            }
            HStack {
                Text("소요시간")
                TextField(text: .constant("시간"), prompt: Text("소요시간")) {
                    Text("소요시간")
                }
            }
        }
        .textFieldStyle(.roundedBorder)
    }
    
}

private struct WriteEstimateWarningMessgageView: View {
    
    var body: some View {
        Text("보낸 견적은 견적 마감일 전까지 유효합니다.")
            .font(.title2)
    }
    
}

private struct WriteEstimateButtonsView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        HStack {
            Button(role: .destructive, action: { dismiss() }) {
                Spacer()
                Text("취소")
                Spacer()
            }
            NavigationLink(destination: Text("Hello World")) {
                Spacer()
                Text("견적서 전송")
                Spacer()
            }
        }
        .buttonStyle(.borderedProminent)
        .font(.title2)
    }
    
}

struct WriteEstimateView_Previews: PreviewProvider {
    
    static var previews: some View {
        WriteEstimateView()
    }
    
}
