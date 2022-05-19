//
//  ReviewListViewModel.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/18.
//

import Foundation

@MainActor
final class ReviewListViewModel: ObservableObject {
    
    private var appService: AppService {
        BaetaverseBusinessApp.appService
    }
    
    @Published private(set) var reviews: [ReviewEntity] = []
    
    func fetchReviews() async throws {
        self.reviews = try await appService.queryReviews()
    }
    
}
