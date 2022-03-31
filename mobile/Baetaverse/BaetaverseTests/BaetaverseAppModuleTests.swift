//
//  BaetaverseAppModuleTests.swift
//  BaetaverseTests
//
//  Created by JeongTaek Han on 2022/03/31.
//

import XCTest

class BaetaverseAppModuleTests: XCTestCase {
    
    private var sutBaetaverse: AppService!

    override func setUpWithError() throws {
        let networkService = NetworkServiceProvider()
        let auth = BaetaverseAuth(networkService: networkService)
        let businessService = BaetaverseBusinessService(networkService: networkService)
        let appService = BaetaverseAppService(auth: auth, businessService: businessService)
        self.sutBaetaverse = appService
    }

    override func tearDownWithError() throws {
        self.sutBaetaverse = nil
    }

    func testExample() async throws {
        try await sutBaetaverse.login(
            email: "test@test.com",
            password: "12341234"
        )
        
        XCTAssert(sutBaetaverse.isLogin)
    }

}
