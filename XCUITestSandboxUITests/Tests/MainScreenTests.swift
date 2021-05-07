//
//  MainScreenTests.swift
//  XCUITestSandboxUITests
//
//  Created by Michal Terlicki on 20/03/2021.
//  Copyright © 2021 Hacking with Swift. All rights reserved.
//

import XCTest

class MainScreenTests: XCTestCase {

    override func setUpWithError() throws {
        let app = XCUIApplication()
        app.launchArguments = ["enable-testing"]
        app.launch()
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testExistingElements() throws {
        let app = XCUIApplication()
        let mainScreen = MainScreen(app: app)
        
        XCTAssertTrue(mainScreen.navTitle.exists)
        XCTAssertTrue(mainScreen.textField.exists)
        XCTAssertTrue(mainScreen.textLabel.exists)
        XCTAssertTrue(mainScreen.slider.exists)
        XCTAssertTrue(mainScreen.progressBar.exists)
        XCTAssertTrue(mainScreen.segementedControlButtonAlpha.exists)
        XCTAssertTrue(mainScreen.segementedControlButtonOmega.exists)
        XCTAssertTrue(mainScreen.redButton.exists)
        XCTAssertTrue(mainScreen.greenButtton.exists)
        XCTAssertTrue(mainScreen.blueButton.exists)
        //XCTAssertTrue(mainScreen.datePicker.exists)
        XCTAssertTrue(mainScreen.datePresentationLabel.exists)
        XCTAssertTrue(mainScreen.datePresentationLabel.exists)
    }

    func testDatePicker() {
        
        
    }
}
