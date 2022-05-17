//
//  EstimateRequestsViewModel.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/17.
//

import Foundation

@MainActor
final class EstimateRequestsViewModel: ObservableObject {
    
    @Published var estimatesRequests: [EstimateRequest] = []
    
    private var appService: AppService {
        BaetaverseBusinessApp.appService
    }
    
    func queryAllEstimatesRequests() async throws {
        self.estimatesRequests = try await appService.queryAllEstimatesRequest()
        self.estimatesRequests.sort { first, second in
            first.closingDate < second.closingDate
        }
    }
    
}
