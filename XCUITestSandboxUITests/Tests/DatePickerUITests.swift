//
//  DatePickerUITests.swift
//  XCUITestSandboxUITests
//
//  Created by Michal Terlicki on 21/05/2021.
//  Copyright © 2021 Hacking with Swift. All rights reserved.
//

import XCTest

class DatePickerUITests: XCTestCase {

    override func setUpWithError() throws {
        let app = XCUIApplication()
        app.launchArguments = ["enable-testing"]
        app.launch()
        continueAfterFailure = false
    }

    override func tearDownWithError() throws {
        // Put teardown code here. This method is called after the invocation of each test method in the class.
    }

    func testInitialDatePrestentationIsEmpty() {
        let app = XCUIApplication()
        let mainScreen = MainScreen(app: app)
        
        XCTAssertTrue(mainScreen.datePresentationLabel.label == "")
    }
    
    func testLabelShowingPickedDate() {
        let app = XCUIApplication()
        let mainScreen = MainScreen(app: app)
        
        let date = dateSinceTodayToString(gate: 1)
        
        let collectionViewsQuery = app.datePickers.collectionViews
        collectionViewsQuery.buttons[date].tap()
        
        XCTAssertTrue(mainScreen.datePresentationLabel.label == date)
    }
    
    func testLabelShowingChangedDate() {
        let app = XCUIApplication()
        let mainScreen = MainScreen(app: app)
        
        let pastDate = dateSinceTodayToString(gate: 1)
        
        let collectionViewsQuery = app.datePickers.collectionViews
        collectionViewsQuery.buttons[pastDate].tap()
        
        XCTAssertTrue(mainScreen.datePresentationLabel.label == pastDate)
        
        let futureDate = dateSinceTodayToString(gate: 3)
        
        collectionViewsQuery.buttons[futureDate].tap()

        XCTAssertTrue(mainScreen.datePresentationLabel.waitForExistence(timeout: 0.5))
        XCTAssertTrue(mainScreen.datePresentationLabel.label == futureDate)
    }
    
    

    
    func dayFormatter(date: Date) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE, MMMM d"
            let day = dateFormatter.string(from: date)
            
            return day
    }
    
    func dateSinceTodayToString(gate: Double) -> String {
        
        
        if (gate == 0)
        {
            let dayname = dayFormatter(date: Date())
            return dayname
        }
        else
        {
            let dayname = dayFormatter(date: Date(timeInterval: (gate * 86400) , since: Date()))
            return dayname
        }
    }

}
