//
//  NetworkTests.swift
//  IsobarApp
//
//  Created by Humberto Vieira on 26/12/16.
//  Copyright © 2016 Humberto Vieira. All rights reserved.
//

import XCTest
@testable import IsobarApp

class NetworkTests: XCTestCase, BandServiceProtocol {
    
    let service = BandService()
    
    override func setUp() {
        super.setUp()
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }
    
    override func tearDown() {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
        super.tearDown()
    }
    
    func testExample() {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testPerformanceExample() {
        // This is an example of a performance test case.
        self.measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    func testGetBandListFromJson() {
        let array = service.getBandList()
        XCTAssert(array.count > 0)
    }
    
    func testGetBandInformation() {
        let band = Band()
        band.id = "1"
        band.name = "Between the Buried and Me"
        service.getExtraInformation(band: band)
        service.delegate = self
        
    }
    
    func finishGetExtraInformation(band: Band) {
        XCTAssert(band.genre != nil)
    }
    
    
    
}
