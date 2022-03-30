//
//  BaetaverseTests.swift
//  BaetaverseTests
//
//  Created by JeongTaek Han on 2022/03/29.
//

import XCTest

final class BaetaverseTests: XCTestCase {
    
    private var sutNetworkModel: NetworkService!

    override func setUpWithError() throws {
        self.sutNetworkModel = NetworkServiceProvider()
    }

    override func tearDownWithError() throws {
        sutNetworkModel = nil
    }

    func test_회원가입요청() async throws {
        // given
        let service: BaetaverseAPIService = .signUp(
            email: "\(Int.random(in: 0...999))@test.com", password: "1234", name: "hello"
        )
        
        // when
        do {
            let result = try await sutNetworkModel.fetchData(for: service)
            print(String(data: result, encoding: .utf8))
            XCTAssert(true)
        } catch {
            XCTFail("Network Error \(error)")
        }
        
    }

}
