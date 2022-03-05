//
//  UITest3.swift
//  UITest3
//
//  Created by Ludovic FAVIER on 02/03/2022.
//  Copyright © 2022 CocoaPods. All rights reserved.
//

import XCTest

class UITest3: XCTestCase {
    var app: XCUIApplication!
    
    override func setUpWithError() throws {

        continueAfterFailure = false
        app = XCUIApplication()
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExample() throws {
        app.launch()
        let annotation = app.maps.element.otherElements["labelYouWillUseToFindIt"]
        //annotation.isAccessibilityElement = true
        XCTAssertTrue(annotation.exists, "Pass")
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, watchOS 7.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
