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

}
