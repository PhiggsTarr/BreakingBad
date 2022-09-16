//
//  BreakingBadProjectTests.swift
//  BreakingBadProjectTests
//
//  Created by Kevin Tarr on 9/16/22.
//

import XCTest
@testable import BreakingBadProject

class BreakingBadProjectTests: XCTestCase {

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        // This is an example of a functional test case.
        // Use XCTAssert and related functions to verify your tests produce the correct results.
        // Any test you write for XCTest can be annotated as throws and async.
        // Mark your test throws to produce an unexpected failure when your test encounters an uncaught error.
        // Mark your test async to allow awaiting for asynchronous code to complete. Check the results with assertions afterwards.
    }

    func testPerformanceExample() throws {
        // This is an example of a performance test case.
        measure {
            // Put the code you want to measure the time of here.
        }
    }
    
    
    func testNetworkCall() async{
        
        //Makes network call and returns true if we get data back
        var model: [ModelData] = []
        model = await NetworkingLayer().loadData()
        XCTAssertTrue(model.count > 0)
        
    }
    
    func testImageLoad() async{
        
        //Checks to see if image link leads to a valid URL
        var model: [ModelData] = []
        model = await NetworkingLayer().loadData()
        XCTAssertNotNil(URL(string: model[0].img)!)
    }
    
    func testNameData() async{
        
        //Checks to see if we get data for our names back
        var model: [ModelData] = []
        model = await NetworkingLayer().loadData()
        XCTAssertFalse(model[0].name.isEmpty)
    }
    
    func testNickNameData() async{
        
        //Checks to see if we get data for our nicknames back
        var model: [ModelData] = []
        model = await NetworkingLayer().loadData()
        XCTAssertFalse(model[0].nickname.isEmpty)
    }
}



