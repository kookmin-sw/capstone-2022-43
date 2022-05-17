//
//  EstimateViewModel.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/17.
//

import Foundation

@MainActor
final class EstimateViewModel: ObservableObject {
    
    @Published private(set) var estimates: [QuotationEntity] = []
    
    private var appService: AppService {
        BaetaverseBusinessApp.appService
    }
    
    func fetchEstimates() async throws {
        self.estimates = try await appService.queryEstimates()
    }
    
}
