//
//  EstimateRequestCardView.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/17.
//

import SwiftUI

struct EstimateRequestCardView: View {
    
    @Binding var estimateRequest: EstimateRequest
    
    var body: some View {
        CardView {
            VStack {
                EstimateRequestCardTitleView(estimateRequest: estimateRequest)
                EstimateRequestCardHeaderView(estimateRequest: estimateRequest)
            }
            EstimateRequestCardContentView(estimateRequest: estimateRequest)
        }
    }
    
}

private struct EstimateRequestCardTitleView: View {
    
    let estimateRequest: EstimateRequest
    
    var body: some View {
        HStack {
            HStack {
                Text("출발지 \(estimateRequest.departureCountry)")
                Image(systemName: "arrowtriangle.right.fill")
                Text("도착지 \(estimateRequest.destinationCountry)")
            }
            Spacer()
            Text("무역방식")
            Text(estimateRequest.tradeType)
        }
    }
    
}

private struct EstimateRequestCardHeaderView: View {
    
    let estimateRequest: EstimateRequest
    
    var body: some View {
        HStack {
            Text("마감일: ")
            Text(estimateRequest.closingDate.formatted())
            Spacer()
        }
    }
    
}

private struct EstimateRequestCardContentView: View {
    
    let estimateRequest: EstimateRequest
    
    var body: some View {
        VStack {
            HStack {
                Text("인코텀즈")
                Text(estimateRequest.incoterms)
                Spacer()
            }
            HStack {
                Text("예정운송시작일")
                Text(estimateRequest.forwardingDate.formatted())
                Spacer()
            }
            HStack {
                Text("운송 종류")
                Text(estimateRequest.tradeDetail)
                Spacer()
            }
            Spacer()
        }
        .lineLimit(3)
    }
    
}

struct EstimateRequestCardView_Previews: PreviewProvider {
    
    static var previews: some View {
        let estimateRequest = EstimateRequest(
            id: 123, tradeType: "수출", tradeDetail: "Port To Port",
            forwardingDate: Date(), departureCountry: "KO", departureDetail: "서울",
            destinationCountry: "KP", destinationDetail: "평양", incoterms: "ABC",
            closingDate: Date(), createdAt: Date())
        
        EstimateRequestCardView(estimateRequest: .constant(estimateRequest))
    }
    
}
