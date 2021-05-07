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
        print(completion)
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
    
    func testInitialDate() {
        let app = XCUIApplication()
        let mainScreen = MainScreen(app: app)
        
        XCTAssertTrue(mainScreen.datePresentationLabel.label == "")
    }
    
    func testLabelShowingChangedDate() {
        let app = XCUIApplication()
        let mainScreen = MainScreen(app: app)
        
        let collectionViewsQuery = app.datePickers.collectionViews
        collectionViewsQuery.buttons["Tuesday, May 11"].otherElements.containing(.staticText, identifier:"11").element.tap()
        
        XCTAssertTrue(mainScreen.datePresentationLabel.label != "")
        collectionViewsQuery.buttons["Today, Friday, May 7"].otherElements.containing(.staticText, identifier:"7").element.tap()
        
        let currentDate = dateFormat(date: Date())
        
        XCTAssertTrue(mainScreen.datePresentationLabel.label == currentDate)
    }
    
    func testChangedDateValue() {
        
//        let app = XCUIApplication()
//        let collectionViewsQuery = app.datePickers.collectionViews
//        collectionViewsQuery.buttons["Tuesday, May 11"].otherElements.containing(.staticText, identifier:"11").element.tap()
//        collectionViewsQuery.buttons["Wednesday, May 12"].otherElements.containing(.staticText, identifier:"12").element.tap()
//        collectionViewsQuery.buttons["Wednesday, May 26"].otherElements.containing(.staticText, identifier:"26").element.tap()
        
    }
    
    private func dateFormat(date: Date) -> String {
        let dateFormatter = DateFormatter()
        
        dateFormatter.dateStyle = DateFormatter.Style.long
        
        let strDate = dateFormatter.string(from: date)
        
        return strDate
    }
}
