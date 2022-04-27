//
//  SignUpChooseMembershipView.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/04/27.
//

import SwiftUI

struct SignUpChooseMembershipView: View {
    
    @Environment(\.dismiss) private var dismiss
    
    var body: some View {
        NavigationView {
            Text("Hello World")
                .navigationTitle("회원가입")
                .toolbar {
                    ToolbarItemGroup(placement: .navigationBarTrailing) {
                        Button(role: .cancel, action: {
                            dismiss()
                        }) {
                            Image(systemName: "xmark")
                        }
                    }
                }
        }
    }
    
}

struct SignUpChooseMembershipView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpChooseMembershipView()
    }
}
