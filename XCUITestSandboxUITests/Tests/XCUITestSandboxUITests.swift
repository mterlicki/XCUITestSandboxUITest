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
        
        mainScreen.fillTextField(with: "onomatopeja")
        
        XCTAssertTrue(mainScreen.textLabel.label == "onomatopeja")
    }
    
    func testSliderControlsProgressMax(){
        let app = XCUIApplication()
        let mainScreen = MainScreen(app: app)
        //Max
        mainScreen.setSlider(on: 1)
        guard let completion = mainScreen.progressBar.value as? String else {
                XCTFail()
                return
            }
        XCTAssertTrue(completion == "0%")
    }
    
    func testSliderControlsProgressMin(){
        let app = XCUIApplication()
        let mainScreen = MainScreen(app: app)
        //Min
        mainScreen.setSlider(on: 0)
        guard let completion = mainScreen.progressBar.value as? String else {
                XCTFail()
                return
            }
        XCTAssertTrue(completion == "100%")
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

    func testLaunchPerformance() throws {
        if #available(macOS 10.15, iOS 13.0, tvOS 13.0, *) {
            // This measures how long it takes to launch your application.
            measure(metrics: [XCTApplicationLaunchMetric()]) {
                XCUIApplication().launch()
            }
        }
    }
}
