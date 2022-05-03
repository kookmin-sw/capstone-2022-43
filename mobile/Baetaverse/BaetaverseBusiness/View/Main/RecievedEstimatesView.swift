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
    
    @Binding var estimate: Estimate
    
    var body: some View {
        VStack(alignment: .leading) {
            Text("No. \(estimate.cellIndex)")
            Text("물품명 \(estimate.productName)")
            HStack {
                Text("출발지 \(estimate.departure)")
                Image(systemName: "arrowtriangle.right.fill")
                Text("도착지 \(estimate.destination)")
            }
            Text("인코텀즈 \(estimate.incoterms)")
        }
    }
    
}

struct RecievedEstimatesView_Previews: PreviewProvider {
    
    static var previews: some View {
        
        let estimate = Estimate(
            cellIndex: 1,
            productName: "맥북 프로 14인치",
            departure: "대한민국",
            destination: "중국",
            incoterms: "ABC"
        )
        
        RecievedEstimatesView()
        EstimateCellView(estimate: .constant(estimate))
        
    }
    
}
