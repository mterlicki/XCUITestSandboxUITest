//
//  MainScreen.swift
//  XCUITestSandboxUITests
//
//  Created by Michal Terlicki on 19/03/2021.
//  Copyright © 2021 Hacking with Swift. All rights reserved.
//

import Foundation
import XCTest

public class MainScreen{
    
    let app: XCUIApplication
    
    let navTitle: XCUIElement
    let textField: XCUIElement
    let textLabel: XCUIElement
    let slider: XCUIElement
    let progressBar: XCUIElement
    let segementedControlButtonAlpha: XCUIElement
    let segementedControlButtonOmega: XCUIElement
    let redButton: XCUIElement
    let greenButtton: XCUIElement
    let blueButton: XCUIElement
    let datePicker: XCUIElement
    let dateLabel: XCUIElement
    let datePresentationLabel: XCUIElement
    
    
    init(app: XCUIApplication){
        self.app = app
        navTitle = app.navigationBars["Alpha"]
        textField = app.textFields["textInput"]
        textLabel = app.staticTexts["textLabel"]
        slider = app.sliders["Completion"]
        progressBar = app.progressIndicators["progress"]
        segementedControlButtonAlpha = app.segmentedControls.buttons["Alpha"]
        segementedControlButtonOmega = app.segmentedControls.buttons["Omega"]
        redButton = app.buttons["Red"]
        greenButtton = app.buttons["Green"]
        blueButton = app.buttons["Blue"]
        datePicker = app.datePickers["DatePicker"]
        dateLabel = app.staticTexts["datepicked"]
        datePresentationLabel = app.staticTexts["datePresentationLabel"]
    }
    
    func fillTextField(with: String){
        textField.tap()
        textField.typeText(with)
        //app.keyboards.buttons["Return"].tap()
    }
    
    func setSlider(on: CGFloat){
        app.sliders["Completion"].adjust(toNormalizedSliderPosition: on)
    }
    
    func buttonTap(name: String){
        switch name {
        case "Red":
            redButton.tap()
        case "Blue":
            blueButton.tap()
        case "Green":
            greenButtton.tap()
        default:
           break
        }
    }
}
