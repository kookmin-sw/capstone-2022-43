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
    
    var ratingAverage: Int {
        guard reviews.count > 0 else { return 0 }
        let sum = reviews.reduce(0) { partialResult, review in
            return partialResult + review.rating
        }
        return sum / reviews.count
    }
    
    var estimateReviews: [ReviewEntity] {
        reviews.count > 5 ? Array(reviews[...5]): reviews
    }
    
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
