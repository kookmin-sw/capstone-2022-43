//
//  ConsultationView.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/05.
//

import SwiftUI

struct ConsultationView: View {
    
    @State var currentSegmentView = 0
    
    var body: some View {
        NavigationView {
            ConsultationContentView(currentSegmentView: $currentSegmentView)
                .navigationTitle("상담")
        }
    }
    
}

private struct ConsultationContentView: View {
    
    @Binding var currentSegmentView: Int
    
    var body: some View {
        VStack {
            Picker("상태", selection: $currentSegmentView) {
                Text("요청").tag(0)
                Text("진행중").tag(1)
                Text("만료").tag(2)
            }
            .pickerStyle(.segmented)
            
            if currentSegmentView == 0 {
                ConsultationRequestView()
            } else if currentSegmentView == 1 {
                ConsultationProceedingView()
            } else if currentSegmentView == 2 {
                ConsultationProceedingView()
            }
        }
    }
    
}

struct ConsultationView_Previews: PreviewProvider {
    static var previews: some View {
        ConsultationView()
    }
}
