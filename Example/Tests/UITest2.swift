//
//  UITest2.swift
//  geoTracerJSON_Tests
//
//  Created by Ludovic FAVIER on 02/03/2022.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import XCTest

class UITest2: XCTestCase {
    var app: XCUIApplication!

    override func setUpWithError() throws {
        // Put setup code here. This method is called before the invocation of each test method in the class.

        // In UI tests it is usually best to stop immediately when a failure occurs.
        continueAfterFailure = false

        // UI tests must launch the application that they test. Doing this in setup will make sure it happens for each test method.
        app = XCUIApplication()

        // In UI tests it’s important to set the initial state - such as interface orientation - required for your tests before they run. The setUp method is a good place to do this.
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        app.launch()
        let annotation = app.maps.element.otherElements["labelYouWillUseToFindIt"]
        
//        annotation.tap()
        XCTAssertTrue(annotation.exists, "Pass")
    }

}
