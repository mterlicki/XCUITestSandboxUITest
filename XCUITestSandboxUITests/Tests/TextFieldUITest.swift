//
//  TextFieldUITest.swift
//  XCUITestSandboxUITests
//
//  Created by Michal Terlicki on 21/05/2021.
//  Copyright © 2021 Hacking with Swift. All rights reserved.
//

import XCTest

class TextFieldUITest: XCTestCase {

    override func setUpWithError() throws {
        let app = XCUIApplication()
        app.launchArguments = ["enable-testing"]
        app.launch()
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testLabelCopiesTextField() throws {
        let app = XCUIApplication()
        let mainScreen = MainScreen(app: app)
        
        mainScreen.fillTextField(with: "onomatopeja")
        
        XCTAssertTrue(mainScreen.textLabel.label == "onomatopeja")
    }

}
