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

    func testExample() async throws {
        // given
        let url = URL(string: "127.0.0.1:8080")!
        let urlRequest = URLRequest(url: url)
        
        // when
        let result = try? await sutNetworkModel.fetchData(for: urlRequest)
        
        XCTAssertNotNil(result)
    }

}
