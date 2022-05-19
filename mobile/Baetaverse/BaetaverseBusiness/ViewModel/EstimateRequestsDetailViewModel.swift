//
//  EstimateRequestsDetailViewModel.swift
//  BaetaverseBusiness
//
//  Created by JeongTaek Han on 2022/05/18.
//

import Foundation

@MainActor
final class EstimateRequestsDetailViewModel: ObservableObject {
    
    @Published private(set) var estimateRequest = EstimateRequest()
    @Published private(set) var product: [Product] = []
    
    private var appService: AppService {
        BaetaverseBusinessApp.appService
    }
    
    func fetchEstimateRequestDetail(id: Int) async throws {
        let datas = try await appService.queryAllEstimatesRequest()
        let result = datas.filter { estimateRequest in
            estimateRequest.id ?? 0 == id
        }
        self.estimateRequest = result.first ?? EstimateRequest()
    }
    
}
