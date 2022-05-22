//
//  ConsultationProceedingView.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/05.
//

import SwiftUI

struct ConsultationProceedingView: View {
    
    var body: some View {
        VStack {
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

struct ConsultationProceedingView_Previews: PreviewProvider {
    static var previews: some View {
        ConsultationProceedingView()
    }
}
