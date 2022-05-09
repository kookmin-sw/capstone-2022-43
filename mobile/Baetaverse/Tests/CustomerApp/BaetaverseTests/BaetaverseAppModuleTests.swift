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
        self.sutBaetaverse = BaetaverseAppService.configure()
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
    
//    func test_새로운_견적_등록하기가_정상적으로_동작해야한다() async throws {
//        try await sutBaetaverse.login(
//            email: "test@test.com",
//            password: "12341234"
//        )
//        
//        try await sutBaetaverse.registerEvaluate(
//            id: UUID().uuidString,
//            HSCode: "1234",
//            country: "USA"
//        )
//        
//        XCTAssert(true)
//    }
    
    func test_견적서_명단_조회하기() async throws {
        let data = try await sutBaetaverse.fetchEvaluates()
        print(data)
        XCTAssert(true)
    }

}
