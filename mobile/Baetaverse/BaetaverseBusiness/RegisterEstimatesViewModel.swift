//
//  RegisterEstimatesViewModel.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/17.
//

import Foundation

final class RegisterEstimatesViewModel: ObservableObject {
    
    private var appService: AppService {
        BaetaverseBusinessApp.appService
    }
    
    func register(estimate: Estimate) async throws {
        try await appService.registerEstimate(estimate: estimate)
    }
    
}
