//
//  XCUITestSandboxUITests.swift
//  XCUITestSandboxUITests
//
//  Created by Michal Terlicki on 19/03/2021.
//  Copyright © 2021 Hacking with Swift. All rights reserved.
//

import XCTest

class XCUITestSandboxUITests: XCTestCase {

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
        
        app.textFields.element.tap()

        app.keys["t"].tap()
        app.keys["e"].tap()
        app.keys["s"].tap()
        app.keys["t"].tap()
        app.keyboards.buttons["Return"].tap()
        
        XCTAssertTrue(app.staticTexts["textLabel"].label == "test")
    }
    
    func testSliderControlsProgress(){
        let app = XCUIApplication()
        
        //Max
        app.sliders["Completion"].adjust(toNormalizedSliderPosition: 1)
        guard let completion = app.progressIndicators.element.value as? String else {
                XCTFail()
                return
            }
        XCTAssertTrue(completion == "0%")
        
        //Min
        app.sliders["Completion"].adjust(toNormalizedSliderPosition: 0)
        guard let completion2 = app.progressIndicators.element.value as? String else {
                XCTFail()
                return
            }
        XCTAssertTrue(completion2 == "100%")
    }
    
    func testButtonsShowAlerts(){
        let app = XCUIApplication()
        
        //Blue button
        app.buttons["Blue"].tap()
        XCTAssertTrue(app.alerts["Blue"].exists)
        app.alerts["Blue"].buttons["OK"].tap()
        
        //Red button
        app.buttons["Red"].tap()
        XCTAssertTrue(app.alerts["Red"].exists)
        app.alerts["Red"].buttons["OK"].tap()
        
        //Green Button
        app.buttons["Green"].tap()
        XCTAssertTrue(app.alerts["Green"].exists)
        app.alerts["Green"].buttons["OK"].tap()
    }
    
    func testSegementedControlChangesNavitationTitle(){
        let app = XCUIApplication()
        
        //Omega button
        app.segmentedControls.buttons["Omega"].tap()
        XCTAssertTrue(app.navigationBars["Omega"].exists)
        
        //Alpha Button
        app.segmentedControls.buttons["Alpha"].tap()
        XCTAssertTrue(app.navigationBars["Alpha"].exists)
        
    }

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
