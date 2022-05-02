//
//  SignUpFormView.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/02.
//

import SwiftUI

struct SignUpFormView: View {
    
    @State private var signUpForm = SignUpInformationForm()
    
    var body: some View {
        SignUpInformationFormView(signUpForm: $signUpForm)
            .navigationTitle("그룹(업체) 가입")
    }
    
}

struct SignUpInformationFormView: View {
    
    @Binding var signUpForm: SignUpInformationForm
    
    private let groupNameLabel = "업체명"
    private let groupContactNumberLabel = "대표번호"
    private let managerContactNumberLabel = "담당자연락처"
    private let openingDateLabel = "개업일"
    private let representativeNameLabel = "대표자이름"
    private let companyRegistrationNumberLabel = "사업자등록번호"
    private let addressLabel = "주소"
    private let emailAddressLabel = "대표이메일"
    private let representativeImageLabel = "대표이미지"
    
    var body: some View {
        ScrollView {
            VStack {
                TextField(
                    groupNameLabel,
                    text: $signUpForm.groupName
                )
                TextField(
                    groupContactNumberLabel,
                    text: $signUpForm.groupContactNumber
                )
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
                TextField(
                    addressLabel,
                    text: $signUpForm.address
                )
                TextField(
                    emailAddressLabel,
                    text: $signUpForm.email
                )
                Image(systemName: "person")
            }
            .textFieldStyle(.roundedBorder)
            .padding()
        }
    }
    
}

struct SignUpInformationForm {
    
    var groupName = ""
    var groupContactNumber = ""
    var managerContactNumber = ""
    var openingDate = Date()
    var representativeName = ""
    var companyRegistrationNumber = ""
    var address = ""
    var email = ""
    
}

struct SignUpFormView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpFormView()
    }
}
