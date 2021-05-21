//
//  NavigationBarUITests.swift
//  XCUITestSandboxUITests
//
//  Created by Michal Terlicki on 21/05/2021.
//  Copyright © 2021 Hacking with Swift. All rights reserved.
//

import XCTest

class NavigationBarUITests: XCTestCase {

    override func setUpWithError() throws {
        let app = XCUIApplication()
        app.launchArguments = ["enable-testing"]
        app.launch()
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testSegementedControlChangesNavitationTitle(){
        let app = XCUIApplication()
        let mainScreen = MainScreen(app: app)
            
        //Omega button
        mainScreen.segementedControlButtonOmega.tap()
        XCTAssertTrue(mainScreen.segementedControlButtonOmega.exists)
        XCTAssertTrue(app.navigationBars["Omega"].exists)
            
            
        //Alpha Button
        mainScreen.segementedControlButtonAlpha.tap()
        XCTAssertTrue(mainScreen.segementedControlButtonAlpha.exists)
        XCTAssertTrue(app.navigationBars["Alpha"].exists)
    }

}
