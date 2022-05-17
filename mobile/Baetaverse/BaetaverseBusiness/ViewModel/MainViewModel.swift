//
//  MainViewModel.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/10.
//

import Foundation

@MainActor
final class MainViewModel: ObservableObject {
    
    private var appService: AppService {
        BaetaverseBusinessApp.appService
    }
    
    @Published private(set) var estimateRequests: [EstimateRequest] = []
    @Published private(set) var reviews: [ReviewEntity] = []
    
    func fetchEstimateRequests() async throws {
        let datas = try await appService.queryAllEstimatesRequest()
        let result = datas
            .filter({ $0.closingDate > Date() })
            .sorted(by: { $0.closingDate < $1.closingDate })
        self.estimateRequests = result.count > 5 ? Array(result[...5]): result
    }
    
    func fetchReviews() async throws {
        self.reviews = try await appService.queryReviews()
    }
    
}
