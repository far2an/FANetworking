//
//  FANetworkingTests.swift
//  FANetworkingTests
//
//  Created by Farzan on 8/25/19.
//  Copyright © 2019 Farzan. All rights reserved.
//

import XCTest
@testable import FANetworking

class ResponseTest: XCTestCase {
    let baseURL = "http://httpbin.org"

    func testDataAccessor() {
        let networking = Networking(baseURL: baseURL)
        let expectedBody = ["user-agent": "hello!"]
        networking.headerFields = expectedBody
        networking.get("/user-agent") { result in
            switch result {
            case let .success(response):
                XCTAssertEqual(response.data.toStringStringDictionary().debugDescription, expectedBody.debugDescription)
            case .failure:
                XCTFail()
            }
        }
    }
}
