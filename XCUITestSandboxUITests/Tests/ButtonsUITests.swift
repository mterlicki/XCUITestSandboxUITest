//
//  ButtonsUITests.swift
//  XCUITestSandboxUITests
//
//  Created by Michal Terlicki on 21/05/2021.
//  Copyright © 2021 Hacking with Swift. All rights reserved.
//

import XCTest

class ButtonsUITests: XCTestCase {

    override func setUpWithError() throws {
        let app = XCUIApplication()
        app.launchArguments = ["enable-testing"]
        app.launch()
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testBlueButtonsShowAlerts(){
        let app = XCUIApplication()
        let mainScreen = MainScreen(app: app)
        
        mainScreen.buttonTap(name: "Blue")
        XCTAssertTrue(app.alerts["Blue"].exists)
        app.alerts["Blue"].buttons["OK"].tap()
    }
    
    func testRedButtonsShowAlerts(){
        let app = XCUIApplication()
        let mainScreen = MainScreen(app: app)
        
        mainScreen.buttonTap(name: "Red")
        XCTAssertTrue(app.alerts["Red"].exists)
        app.alerts["Red"].buttons["OK"].tap()
    }
    
    func testGreenButtonsShowAlerts(){
        let app = XCUIApplication()
        let mainScreen = MainScreen(app: app)
        
        mainScreen.buttonTap(name: "Green")
        XCTAssertTrue(app.alerts["Green"].exists)
        app.alerts["Green"].buttons["OK"].tap()
    }


}
