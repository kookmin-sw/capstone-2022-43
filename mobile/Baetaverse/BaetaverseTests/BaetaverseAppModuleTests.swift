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

    func test_알맞은_계정이_입력되면_정상적으로_로그인되어야한다() async throws {
        try await sutBaetaverse.login(
            email: "test@test.com",
            password: "12341234"
        )
        
        XCTAssert(sutBaetaverse.isLogin)
    }
    
    func test_회원가입_정상적으로_동작해야한다() async throws {
        try await sutBaetaverse.signUp(
            email: "\(Int.random(in: 0...999))@test.com",
            password: "12341234",
            name: "testSignUp"
        )
        XCTAssert(true)
    }
    
    func test_새로운_견적_등록하기가_정상적으로_동작해야한다() async throws {
        try await sutBaetaverse.login(
            email: "test@test.com",
            password: "12341234"
        )
        
        try await sutBaetaverse.registerEvaluate(
            id: UUID().uuidString,
            HSCode: "1234",
            country: "USA"
        )
        
        XCTAssert(true)
    }

}
