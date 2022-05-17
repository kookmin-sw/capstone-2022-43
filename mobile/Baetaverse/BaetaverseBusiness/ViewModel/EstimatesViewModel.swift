//
//  EstimatesViewModel.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/17.
//

import Foundation

@MainActor
final class EstimatesViewModel: ObservableObject {
    
    @Published var estimatesRequests: [EstimateRequest] = [] {
        didSet {
            print(estimatesRequests)
        }
    }
    
    private var appService: AppService {
        BaetaverseBusinessApp.appService
    }
    
    func queryAllEstimatesRequests() async throws {
        self.estimatesRequests = try await appService.queryAllEstimatesRequest()
    }
    
}
