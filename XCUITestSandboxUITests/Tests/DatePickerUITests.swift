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
        
        XCTAssertTrue(mainScreen.datePresentationLabel.label == "-")
    }
    
    func testLabelShowingPickedDate() {
        let app = XCUIApplication()
        let mainScreen = MainScreen(app: app)
        
        let date = dateSinceTodayToString(gate: 1)
        let collectionViewsQuery = app.datePickers.collectionViews
        collectionViewsQuery.buttons[date].tap()
        
        XCTAssertTrue(mainScreen.datePresentationLabel.label == date)
        XCTAssertTrue(collectionViewsQuery.buttons[date].isSelected)
    }
    
    func testLabelShowingChangedDate() {
        let app = XCUIApplication()
        let mainScreen = MainScreen(app: app)
        let collectionViewsQuery = app.datePickers.collectionViews
        
        // Wybór 1 daty
        let firstDate = dateSinceTodayToString(gate: 12)
        collectionViewsQuery.buttons[firstDate].tap()
        
        XCTAssertTrue(mainScreen.datePresentationLabel.label == firstDate)
        XCTAssertTrue(collectionViewsQuery.buttons[firstDate].isSelected)
        
        //Wybór 2 daty
        let secondDate = dateSinceTodayToString(gate: 5)
        collectionViewsQuery.buttons[secondDate].tap()
        collectionViewsQuery.buttons[secondDate].tap()
        print("Tapnięcie " + secondDate)
        
        XCTAssertTrue(mainScreen.datePresentationLabel.waitForExistence(timeout: 6))
        //XCTAssertTrue(collectionViewsQuery.buttons[secondDate].isSelected)
        XCTAssertFalse(collectionViewsQuery.buttons[firstDate].isSelected)
        print("labelka = " + mainScreen.datePresentationLabel.label + "\n second date = " + secondDate)
        XCTAssertTrue(mainScreen.datePresentationLabel.label == secondDate)
        
        
    }
    
    

    
    private func dayFormatter(date: Date) -> String {
            let dateFormatter = DateFormatter()
            dateFormatter.dateFormat = "EEEE, MMMM d"
            let day = dateFormatter.string(from: date)
            
            return day
    }
    
    private func dateSinceTodayToString(gate: Double) -> String {
        
        
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
