//
//  ConsultationCellView.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/05.
//

import SwiftUI

struct ConsultationCellView: View {
    
    var index: Int
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("\(index). 견적요청마감 D-03")
            HStack {
                Text("출발지 어디 어디")
                Image(systemName: "arrowtriangle.right.fill")
                Text("도착지 어디 어디")
            }
            Text("물품명: 블라블라")
        }
    }
    
}

struct ConsultationCellView_Previews: PreviewProvider {
    
    static var previews: some View {
        ConsultationCellView(index: 1)
    }
    
}
