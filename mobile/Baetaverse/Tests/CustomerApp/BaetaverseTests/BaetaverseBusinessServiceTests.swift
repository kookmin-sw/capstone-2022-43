//
//  BaetaverseBusinessServiceTests.swift
//  BaetaverseTests
//
//  Created by JeongTaek Han on 2022/05/09.
//

import XCTest

class BaetaverseBusinessServiceTests: XCTestCase {
    
    private var sutService: BaetaverseBusinessService!

    override func setUpWithError() throws {
        let networkService = NetworkServiceProvider()
        self.sutService = BaetaverseBusinessService(networkService: networkService)
    }

    override func tearDownWithError() throws {
        self.sutService = nil
    }
    
}
