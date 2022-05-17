//
//  RegisterEstimatesView.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/17.
//

import SwiftUI

struct RegisterEstimatesView: View {
    
    let id: Int
    
    @Environment(\.dismiss) private var dismiss
    @StateObject private var viewModel = RegisterEstimatesViewModel()
    @State private var oceanFreightPrice = ""
    @State private var inlandFreightPrice = ""
    @State private var totalPrice = ""
    @State private var estimatedTime = ""
    
    private var estimate: Estimate {
        Estimate(
            requestId: id,
            oceanFreightPrice: Int(oceanFreightPrice) ?? 0,
            inlandFreightPrice: Int(inlandFreightPrice) ?? 0,
            totalPrice: Int(totalPrice) ?? 0,
            estimatedTime: Int(estimatedTime) ?? 0
        )
    }
    
    var body: some View {
        NavigationView {
            RegisterEstimatesContentView(
                oceanFreightPrice: $oceanFreightPrice,
                inlandFreightPrice: $inlandFreightPrice,
                totalPrice: $totalPrice,
                estimatedTime: $estimatedTime
            )
            .navigationTitle("견적서 등록하기")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .navigationBarLeading) {
                    Button(role: .cancel, action: { dismiss() }) {
                        Text("닫기")
                    }
                }
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button(role: .none, action: registerButtonClicked) {
                        Text("등록")
                    }
                }
                
            }
        }
    }
    
    private func registerButtonClicked() {
        Task {
            try? await viewModel.register(estimate: estimate)
            dismiss()
        }
    }
    
}

private struct RegisterEstimatesContentView: View {
    
    @Binding var oceanFreightPrice: String
    @Binding var inlandFreightPrice: String
    @Binding var totalPrice: String
    @Binding var estimatedTime: String
    
    var body: some View {
        Form {
            List {
                TextField("해상운송비용", text: $oceanFreightPrice)
                TextField("육상운송비용", text: $inlandFreightPrice)
                TextField("예상운송시간", text: $estimatedTime)
                TextField("총 운송비용", text: $totalPrice)
            }
        }
    }
    
}

struct RegisterEstimatesView_Previews: PreviewProvider {
    
    static var previews: some View {
        RegisterEstimatesView(id: 0)
    }
    
}
