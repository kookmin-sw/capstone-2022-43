//
//  ContentView.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/04/27.
//

import SwiftUI

@MainActor
struct LoginView: View {
    
    @StateObject var viewModel = LoginViewModel()
    
    @State private var username = ""
    @State private var password = ""
    
    @State private var alertIsPresented = false
    @State private var mainIsPresented = false
    
    var body: some View {
        VStack(spacing: 25) {
            LogoView()
            LoginFormView(
                username: $username,
                password: $password
            )
            LoginSubmitButton {
                Task {
                    do {
                        try await viewModel.login(email: username, password: password)
                        mainIsPresented.toggle()
                    } catch {
                        alertIsPresented.toggle()
                    }
                }
            }
            LoginUserInfoButton()
        }
        .padding()
        .alert("로그인에 실패하였습니다", isPresented: $alertIsPresented) {
            Text("입력한 계정을 확인해주세요")
        }
        .fullScreenCover(isPresented: $mainIsPresented) {
            MainTabView()
        }
    }
    
}

private struct LogoView: View {
    
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

private struct LoginFormView: View {
    
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

private struct LoginSubmitButton: View {
    
    private let loginLabel = "로그인"
    
    let action: () -> Void
    
    var body: some View {
        Button(action: action) {
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

private struct LoginUserInfoButton: View {
    
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
