//
//  testrestaurantlistTests.swift
//  testrestaurantlistTests
//
//  Created by MacBook on 11/03/2022.
//

import XCTest
@testable import RestaurantList

class testrestaurantlistTests: XCTestCase {

    var sut:RestaurantsListService!
    let networkMonitor = NetworkMonitor.shared
    
    override func setUpWithError() throws {
        try super.setUpWithError()
        // Put setup code here. This method is called before the invocation of each test method in the class.
        sut = RestaurantsListService()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        sut = nil
        try super.tearDownWithError()
    }

    func testValidApiCallGetsSuccess() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        try XCTSkipUnless(
          networkMonitor.isReachable,
          "Network connectivity needed for this test.")

        // given
        let urlString = AppConfig.restaurantListURL
        
        // 1
        let promise = expectation(description: "Restaurants list successfully fetched")

        // when
        sut.getRestaurants(url: urlString, completion: { success, response, error in
          // then
          if let error = error {
            XCTFail("Error: \(error)")
            return
          } else if success {
              // 2
              promise.fulfill()
            } else {
              XCTFail("Error: Restaurant GET Request failed")
            }
        })
        // 3
        wait(for: [promise], timeout: 5)
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
