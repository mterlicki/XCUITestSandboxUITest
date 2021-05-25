//
//  SliderUITests.swift
//  XCUITestSandboxUITests
//
//  Created by Michal Terlicki on 21/05/2021.
//  Copyright © 2021 Hacking with Swift. All rights reserved.
//

import XCTest

class SliderUITests: XCTestCase {

    override func setUpWithError() throws {
        let app = XCUIApplication()
        app.launchArguments = ["enable-testing"]
        app.launch()
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
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
        XCTAssertTrue(mainScreen.slider.waitForExistence(timeout: 1))
        print(completion)
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
        
        XCTAssertTrue(mainScreen.slider.waitForExistence(timeout: 1))
        print(completion)
        XCTAssertTrue(completion == "100%")
    }

}
