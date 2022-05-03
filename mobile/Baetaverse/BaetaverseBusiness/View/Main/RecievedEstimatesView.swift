//
//  RecievedEstimatesView.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/03.
//

import SwiftUI

struct RecievedEstimatesView: View {
    
    var body: some View {
        Text("Hello World")
            .navigationTitle("받은견적요청서")
            .navigationBarTitleDisplayMode(.inline)
    }
    
}

fileprivate struct EstimateCellView: View {
    
    @Binding var cellIndex: Int
    @Binding var productName: String
    @Binding var departure: String
    @Binding var destination: String
    @Binding var incoterms: String
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("No. \(String(cellIndex))")
            Text("물품명 \(productName)")
            HStack {
                Text("출발지 \(departure)")
                Image(systemName: "arrowtriangle.right.fill")
                Text("도착지 \(destination)")
            }
            Text("인코텀즈 \(incoterms)")
        }
    }
    
}

struct RecievedEstimatesView_Previews: PreviewProvider {
    
    static var previews: some View {
        RecievedEstimatesView()
        EstimateCellView(
            cellIndex: .constant(1),
            productName: .constant("새로운 맥북 프로 14인치"),
            departure: .constant("대한민국"),
            destination: .constant("중국"),
            incoterms: .constant("ABC")
        )
    }
    
}
