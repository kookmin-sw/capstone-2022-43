//
//  RegisterEstimatesView.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/17.
//

import SwiftUI

struct RegisterEstimatesView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            RegisterEstimatesContentView()
                .navigationTitle("견적서 등록하기")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .navigationBarLeading) {
                        Button(role: .cancel, action: { dismiss() }) {
                            Text("닫기")
                        }
                    }
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(role: .none, action: { dismiss() }) {
                            Text("등록")
                        }
                    }
                    
                }
        }
    }
    
}

private struct RegisterEstimatesContentView: View {
    
    var body: some View {
        Form {
            List {
                TextField("해상운송비용", text: .constant(""))
                TextField("육상운송비용", text: .constant(""))
                TextField("예상운송시간", text: .constant(""))
                TextField("총 운송비용", text: .constant(""))
            }
        }
    }
    
}

struct RegisterEstimatesView_Previews: PreviewProvider {
    
    static var previews: some View {
        RegisterEstimatesView()
    }
    
}
