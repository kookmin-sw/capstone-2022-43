//
//  ConsultationRequestView.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/05.
//

import SwiftUI

struct ConsultationRequestView: View {
    
    var body: some View {
        VStack {
            Text("상담 수락시 1시간 내로 유선을 통해 상담 및 상담 안내를 진행해야 합니다.")
            Divider()
            List {
                NavigationLink(destination: Text("Hello World")) {
                    ConsultationCellView(index: 0)
                }
                NavigationLink(destination: Text("Hello World")) {
                    ConsultationCellView(index: 1)
                }
                NavigationLink(destination: Text("Hello World")) {
                    ConsultationCellView(index: 2)
                }
            }
        }
    }
    
}

struct ConsultationRequestView_Previews: PreviewProvider {
    static var previews: some View {
        ConsultationRequestView()
    }
}
