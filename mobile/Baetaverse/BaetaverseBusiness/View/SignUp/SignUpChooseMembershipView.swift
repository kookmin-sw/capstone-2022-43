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
            SignUpChooseMembershipButton()
                .padding()
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

fileprivate struct SignUpChooseMembershipButton: View {
    
    var body: some View {
        VStack(spacing: 25) {
            NavigationLink(destination: SignUpFormView()) {
                Spacer()
                Text("그룹(업체) 가입")
                Spacer()
            }
            NavigationLink(destination: Text("Hello World 2")) {
                Spacer()
                Text("개인 가입")
                Spacer()
            }
        }
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
    }
    
}

struct SignUpChooseMembershipView_Previews: PreviewProvider {
    
    static var previews: some View {
        SignUpChooseMembershipView()
    }
    
}
