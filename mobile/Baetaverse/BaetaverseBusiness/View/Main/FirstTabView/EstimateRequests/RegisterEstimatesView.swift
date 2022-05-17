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
                    ToolbarItem(placement: .navigationBarTrailing) {
                        Button(role: .cancel, action: { dismiss() }) {
                            Text("닫기")
                        }
                    }
                }
        }
    }
    
}

private struct RegisterEstimatesContentView: View {
    
    var body: some View {
        Text("Hello World")
    }
    
}

struct RegisterEstimatesView_Previews: PreviewProvider {
    
    static var previews: some View {
        RegisterEstimatesView()
    }
    
}
