//
//  SignUpFormViewModel.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/18.
//

import Foundation

final class SignUpFormViewModel: ObservableObject {
    
    private var appService: AppService {
        BaetaverseBusinessApp.appService
    }
    
    func signUp(with form: SignUpGroupForm) async throws {
        try await appService.signUp(
            permission: .forwarder,
            email: form.email,
            password: form.password,
            name: form.representativeName,
            phoneNumber: form.contactNumber,
            corporationName: form.name,
            corporationNumber: form.managerContactNumber
        )
    }
    
}
