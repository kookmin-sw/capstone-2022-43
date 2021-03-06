//
//  SignUpFormView.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/02.
//

import SwiftUI

struct SignUpFormView: View {
    
    @State private var signUpForm = SignUpGroupForm()
    @StateObject private var viewModel = SignUpFormViewModel()
    @Binding var isPresented: Bool
    
    var body: some View {
        NavigationView {
            SignUpInformationFormView(
                signUpForm: $signUpForm,
                viewModel: viewModel,
                isPresented: $isPresented
            )
            .navigationTitle("회원가입")
        }
    }
    
}

private struct SignUpInformationFormView: View {
    
    @Binding var signUpForm: SignUpGroupForm
    @ObservedObject var viewModel: SignUpFormViewModel
    @Binding var isPresented: Bool
    
    var body: some View {
        ScrollView {
            VStack(spacing: 30) {
                IdPasswordFormView(signUpForm: $signUpForm)
                ProfileFormView(signUpForm: $signUpForm)
                ProfileDetailFormView(signUpForm: $signUpForm)
                SignUpButton(
                    isPresented: $isPresented,
                    viewModel: viewModel,
                    form: signUpForm
                )
            }
            .textFieldStyle(.roundedBorder)
            .padding()
        }
    }
    
}

private struct IdPasswordFormView: View {
    
    @Binding var signUpForm: SignUpGroupForm
    
    private let idLabel = "아이디"
    private let passwordLabel = "비밀번호"
    private let verifyPasswordLabel = "비밀번호확인"
    
    var body: some View {
        VStack {
            TextField(idLabel, text: $signUpForm.id)
            TextField(passwordLabel, text: $signUpForm.password)
            TextField(verifyPasswordLabel, text: $signUpForm.verifyPassword)
        }
    }
    
}

private struct ProfileFormView: View {
    
    @Binding var signUpForm: SignUpGroupForm
    
    private let groupNameLabel = "업체명"
    private let groupContactNumberLabel = "대표번호"
    private let emailAddressLabel = "대표이메일"
    private let addressLabel = "주소"
    
    var body: some View {
        VStack {
            TextField(groupNameLabel, text: $signUpForm.name)
            TextField(groupContactNumberLabel, text: $signUpForm.contactNumber)
            TextField(emailAddressLabel, text: $signUpForm.email)
            TextField(addressLabel, text: $signUpForm.address)
        }
    }
    
}

private struct ProfileDetailFormView: View {
    
    @Binding var signUpForm: SignUpGroupForm
    
    private let representativeNameLabel = "대표자이름"
    private let companyRegistrationNumberLabel = "사업자등록번호"
    private let managerContactNumberLabel = "담당자연락처"
    private let openingDateLabel = "개업일"
    
    var body: some View {
        VStack {
            TextField(
                managerContactNumberLabel,
                text: $signUpForm.managerContactNumber
            )
            DatePicker(
                    openingDateLabel,
                    selection: $signUpForm.openingDate,
                    displayedComponents: [.date]
            )
            TextField(
                representativeNameLabel,
                text: $signUpForm.representativeName
            )
            TextField(
                companyRegistrationNumberLabel,
                text: $signUpForm.companyRegistrationNumber
            )
        }
    }
    
}

private struct SignUpButton: View {
    
    @Binding var isPresented: Bool
    @ObservedObject var viewModel: SignUpFormViewModel
    let form: SignUpGroupForm
    
    var body: some View {
        HStack {
            Button(action: { isPresented.toggle() }) {
                Spacer()
                Text("취소")
                Spacer()
            }
            .buttonStyle(.bordered)
            Button(action: {
                Task {
                    try? await viewModel.signUp(with: form)
                    isPresented.toggle()
                }
            }) {
                Spacer()
                Text("확인")
                Spacer()
            }
            .buttonStyle(.borderedProminent)
        }
        .font(.title3)
    }
    
}

struct SignUpFormView_Previews: PreviewProvider {
    
    static var previews: some View {
        SignUpFormView(isPresented: .constant(true))
    }
    
}
