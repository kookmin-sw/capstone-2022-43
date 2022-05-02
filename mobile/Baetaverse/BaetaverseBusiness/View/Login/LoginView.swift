//
//  ContentView.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/04/27.
//

import SwiftUI

struct LoginView: View {
    
    @State private var username = ""
    @State private var password = ""
    
    var body: some View {
        VStack(spacing: 25) {
            LogoView()
            LoginFormView(
                username: $username,
                password: $password
            )
            LoginSubmitButton()
            LoginUserInfoButton()
        }
        .padding()
    }
    
}

struct LogoView: View {
    
    private let title = "BAETAVERSE"
    private let subtitle = "LCL 화물 대상 물류비 견적 플랫폼"
    
    var body: some View {
        VStack(spacing: 5) {
            Text(title)
                .font(.largeTitle)
            Text(subtitle)
                .font(.title2)
        }
    }
    
}

struct LoginFormView: View {
    
    @Binding var username: String
    @Binding var password: String
    
    private let usernameLabel = "아이디"
    private let passwordLabel = "비밀번호"
    
    var body: some View {
        VStack {
            TextField(usernameLabel, text: $username)
            SecureField(passwordLabel, text: $password)
        }
        .textFieldStyle(.roundedBorder)
        .font(.title2)
    }
    
}

struct LoginSubmitButton: View {
    
    private let loginLabel = "로그인"
    
    var body: some View {
        Button(action: { }) {
            HStack {
                Spacer()
                Text(loginLabel)
                Spacer()
            }
        }
        .buttonStyle(.borderedProminent)
        .controlSize(.large)
    }
    
}

struct LoginUserInfoButton: View {
    
    private let signUpLabel = "회원가입"
    private let findUserInfoLabel = "아이디 / 비밀번호 찾기"
    
    @State private var isPresentingSignUpView = false
    
    var body: some View {
        HStack {
            Spacer()
            Button(signUpLabel) {
                isPresentingSignUpView.toggle()
            }
            Spacer()
            Button(action: { }) {
                Text(findUserInfoLabel)
            }
            Spacer()
        }
        .fullScreenCover(isPresented: $isPresentingSignUpView) {
            SignUpChooseMembershipView()
            
        }
    }
    
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        LoginView()
    }
}
