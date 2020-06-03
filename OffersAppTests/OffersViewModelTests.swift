//
//  OffersViewModelTests.swift
//  OffersAppTests
//
//  Created by Mohanraj S K on 03/06/20.
//  Copyright © 2020 Mohanraj S K. All rights reserved.
//

import XCTest

class OffersViewModelTests: XCTestCase {
    
    var viewModel: OffersViewModel!
    var dataSource: GenericDataSource<OffersList>!

    override func setUp() {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        self.dataSource = GenericDataSource<OffersList>()
        self.viewModel = OffersViewModel(dataSource: dataSource)
    }

    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testvalidData() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        measure {
            
            viewModel.loadOffers(resourcePath: "CurrentOffers")
            XCTAssert(dataSource.data.value.count > 0)

        }
    }
    
    func testinValidData() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        measure {
            
            viewModel.loadOffers(resourcePath: "OldOffers")
            XCTAssert(dataSource.data.value.count == 0)

        }
    }

    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }

}
