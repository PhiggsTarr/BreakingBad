//
//  BreakingBadProjectUITests.swift
//  BreakingBadProjectUITests
//
//  Created by Kevin Tarr on 9/18/22.
//

import XCTest
@testable import BreakingBadProject

class BreakingBadProjectUITests: XCTestCase {
    
    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.
        
        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false
        
        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }
    
    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }
    
    func testCellUIFunctionality() throws {
        // UI tests must launch the application that they test.
        
        //Tests to see if tapping on cell produces expected behavior for opening Detail View Controller
        let app = XCUIApplication()
        app.launchArguments = ["-uitesting"]
        app.launch()
        let cell = app.tables.cells["Walter White"]
        cell.tap()
        let labelName = app.staticTexts["detailNameLabel"].label
        XCTAssertEqual(labelName, "Walter White")
        // Use XCTAssert and related functions to verify your tests produce the correct results.
    }
    
    func testImage() throws {
        
        //Test to see if invalid image actually shows our "Image Not Found" Photo
        let app = XCUIApplication()
        app.launchArguments = ["-uitesting"]
        app.launch()
        let cell = app.tables.cells["Lydia Rodarte-Quayle"]
        let image = cell.images["image-not-found"]
        XCTAssertNotNil(image)
    }
}
