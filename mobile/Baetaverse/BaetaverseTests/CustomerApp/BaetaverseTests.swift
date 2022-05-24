//
//  BaetaverseTests.swift
//  BaetaverseTests
//
//  Created by JeongTaek Han on 2022/05/19.
//

import XCTest

final class BaetaverseTests: XCTestCase {
   
    private var sutBaetaverse: AppService!

    override func setUpWithError() throws {
        self.sutBaetaverse = BaetaverseAppService.configure()
    }

    override func tearDownWithError() throws {
        self.sutBaetaverse = nil
    }

    func test_알맞은_계정이_입력되면_정상적으로_로그인되어야한다() async throws {
        // given
        let email = "test1@test1.com"
        let password = "12341234"
        
        // when
        try await sutBaetaverse.login(
            permission: .owner,
            email: email,
            password: password
        )
        
        // then
        XCTAssertTrue(sutBaetaverse.isLogin)
    }
    
    func test_비밀번호가_잘못된_계정이_입력되면_오류를_반환해야한다() async throws {
        // given
        let email = "test1@test1.com"
        let password = "1234"
        
        // when then
        do {
            try await sutBaetaverse.login(
                permission: .owner,
                email: email,
                password: password
            )
            XCTFail("로그인에 실패해야 하는데 성공하는 오류 발생")
        } catch {
            XCTAssertTrue(true)
        }
    }
    
    func test_없는_사용자_계정으로_로그인하면_오류를_반환해야한다() async throws {
        // given
        let email = "unknown@unknown.com"
        let password = "1234"
        
        // when then
        do {
            try await sutBaetaverse.login(
                permission: .owner,
                email: email,
                password: password
            )
            XCTFail("로그인에 실패해야 하는데 성공하는 오류 발생")
        } catch {
            XCTAssertTrue(true)
        }
    }
    
    func test_회원가입_정상적으로_동작해야한다() async throws {
        // given
        let code = Int.random(in: 10...999999)
        let email = "test\(code)@test\(code).com"
        let password = "12341234"
        let name = "testUser\(code)"
        let phoneNumber = "010-1234-5678"
        
        // when then
        do {
            try await sutBaetaverse.signUp(
                permission: .owner,
                email: email,
                password: password,
                name: name,
                phoneNumber: phoneNumber,
                corporationName: nil,
                corporationNumber: nil
            )
        } catch {
            XCTFail("\(error.localizedDescription)")
        }
    }
    
    func test_이미_등록된_사용자가_회원가입하면_오류를_반환해야한다() async throws {
        // given
        let email = "test1@test1.com"
        let password = "12341234"
        let name = "testUserName"
        let phoneNumber = "010-1234-5678"
        
        // when then
        do {
            try await sutBaetaverse.signUp(
                permission: .owner,
                email: email,
                password: password,
                name: name,
                phoneNumber: phoneNumber,
                corporationName: "훌륭한 회사",
                corporationNumber: "070-1234-5678"
            )
            XCTFail("사용자가 중복 가입되었습니다")
        } catch {
            XCTAssertTrue(true)
        }
    }
    
    func test_010121_코드가_입력되면_살아있는_말이_반환되어야_한다() async throws {
        // given
        let email = "test1@test1.com"
        let password = "12341234"
        let code = "010121"
        
        // when
        try await sutBaetaverse.login(
            permission: .owner,
            email: email,
            password: password
        )
        
        let result = try await sutBaetaverse.queryHSCode(code: code)
        
        // then
        XCTAssertEqual(result, ["010121 : 말(번식용,산동물)"])
    }
    
    func test_로그인된_사용자의_견적요청서_명단이_조회되어야한다() async throws {
        // given
        let email = "test1@test1.com"
        let password = "12341234"
        
        try await sutBaetaverse.login(
            permission: .owner,
            email: email,
            password: password
        )
        
        // when
        let result = try? await sutBaetaverse.queryEstimateRequests()
        if let result = result {
            print(result)
        }
        
        // then
        XCTAssertNotNil(result)
    }
    
    func test_새로운_견적_등록하기가_정상적으로_동작해야한다() async throws {
        // given
        let email = "test1@test1.com"
        let password = "12341234"
        
        let estimateRequest = EstimateRequest(
            id: nil,
            tradeType: "수입",
            tradeDetail: "Port to Port",
            forwardingDate: Date(),
            departureCountry: "USA",
            departureDetail: "NewYork",
            destinationCountry: "South Korea",
            destinationDetail: "Seoul",
            incoterms: "DEF",
            closingDate: Date(),
            createdAt: nil
        )
        
        let products = [
            Product(
                id: nil,
                name: "Apple MacBook Pro",
                price: 2490000,
                weight: 10,
                standardUnit: "Kg",
                hsCode: "123456",
                createdAt: nil
            )
        ]
        
        try await sutBaetaverse.login(
            permission: .owner,
            email: email,
            password: password
        )
        
        // when
        try await sutBaetaverse.registerEvaluateRequest(
            estimateRequest: estimateRequest,
            products: products
        )
        
        // then
        XCTAssert(true)
    }
    
    func test_로그인한_사용자의_2번_견적서가_정상적으로_조회되어야_한다() async throws {
        // given
        let email = "test1@test1.com"
        let password = "12341234"
        
        try await sutBaetaverse.login(
            permission: .owner,
            email: email,
            password: password
        )
        
        // when then
        do {
            _ = try await sutBaetaverse.queryEstimateRequestDetail(id: "1")
            XCTAssert(true)
        } catch {
            XCTFail("\(error)")
        }
    }
    
    func test_1번_견적요청서에_견적이_정상적으로_작성되어야한다() async throws {
        // given
        let email = "test8@test8.com"
        let password = "12341234"
        let estimate = Estimate(
            requestId: 1,
            oceanFreightPrice: 100,
            inlandFreightPrice: 123,
            totalPrice: 223,
            estimatedTime: 5
        )
        
        try await sutBaetaverse.login(
            permission: .forwarder,
            email: email,
            password: password
        )
        
        // when then
        do {
            try await sutBaetaverse.registerEstimate(estimate: estimate)
            XCTAssert(true)
        } catch {
            XCTFail("\(error)")
        }
    }
    
    func test_로그인한_사용자의_견적서_명단을_모두_반환해야한다() async throws {
        // given
        let email = "test8@test8.com"
        let password = "12341234"
        
        try await sutBaetaverse.login(
            permission: .forwarder,
            email: email,
            password: password
        )
        
        // when then
        do {
            let result = try await sutBaetaverse.queryEstimates()
            print(result)
            XCTAssert(true)
        } catch {
            XCTFail("\(error)")
        }
    }
    
    func test_모든_견적요청서_명단을_반환해야한다() async throws {
        // given
        let email = "test8@test8.com"
        let password = "12341234"
        
        try await sutBaetaverse.login(
            permission: .forwarder,
            email: email,
            password: password
        )
        
        // when then
        do {
            let result = try await sutBaetaverse.queryAllEstimatesRequest()
            print(result)
            XCTAssert(true)
        } catch {
            XCTFail("\(error)")
        }
    }
    
    func test_로그인한_사용자의_리뷰_명단이_정상적으로_조회되어야한다() async throws {
        // given
        let email = "test8@test8.com"
        let password = "12341234"
        
        try await sutBaetaverse.login(
            permission: .forwarder,
            email: email,
            password: password
        )
        
        // when then
        do {
            let result = try await sutBaetaverse.queryReviews()
            print(result)
            XCTAssert(true)
        } catch {
            XCTFail("\(error)")
        }
    }
    
    func test_로그인한_사용자의_특정_견적요청서에_대한_견적서가_조회되어야한다() async throws {
        // given
        let email = "test1@test1.com"
        let password = "12341234"
        
        try await sutBaetaverse.login(
            permission: .owner,
            email: email,
            password: password
        )
        
        // when then
        do {
            let result = try await sutBaetaverse.queryEstimatesWithEstimateRequest(estimateRequestId: "2")
            print(result)
            XCTAssert(true)
        } catch {
            XCTFail("\(error)")
        }
    }
    
//    func test_로그인한_사용자의_특정_견적요청서와_견적서에_대한_리뷰가_정상적으로_등록되어야한다() async throws {
//        // given
//        let email = "test1@test1.com"
//        let password = "12341234"
//        
//        try await sutBaetaverse.login(
//            permission: .owner,
//            email: email,
//            password: password
//        )
//        
//        // when then
//        do {
//            try await sutBaetaverse.registerReview(
//                quotationId: 4,
//                requestId: 2,
//                score: 5,
//                message: "서비스가 너무나도 훌륭했어용! 다음에도 이용할께요!"
//            )
//            XCTAssert(true)
//        } catch {
//            XCTFail("\(error)")
//        }
//    }
}
