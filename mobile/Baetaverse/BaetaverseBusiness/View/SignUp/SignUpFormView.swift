//
//  SignUpFormView.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/02.
//

import SwiftUI

struct SignUpFormView: View {
    
    @State private var groupName = ""
    @State private var groupContactNumber = ""
    @State private var managerContactNumber = ""
    @State private var openingDate = Date()
    @State private var representativeName = ""
    @State private var companyRegistrationNumber = ""
    @State private var address = ""
    @State private var email = ""
    
    var body: some View {
        SignUpInformationFormView()
    }
    
}

struct SignUpInformationFormView: View {
    
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
                    text: $groupName
                )
                TextField(
                    groupContactNumberLabel,
                    text: $groupContactNumber
                )
                TextField(
                    managerContactNumberLabel,
                    text: $managerContactNumber
                )
                DatePicker(
                        openingDateLabel,
                        selection: $openingDate,
                        displayedComponents: [.date]
                )
                TextField(
                    representativeNameLabel,
                    text: $representativeName
                )
                TextField(
                    companyRegistrationNumberLabel,
                    text: $companyRegistrationNumber
                )
                TextField(
                    addressLabel,
                    text: $address
                )
                TextField(
                    emailAddressLabel,
                    text: $email
                )
                Image(systemName: "person")
            }
            .textFieldStyle(.roundedBorder)
            .padding()
        }
    }
    
}

struct SignUpFormView_Previews: PreviewProvider {
    static var previews: some View {
        SignUpFormView()
    }
}
