//
//  OnboardingViewUiTests.swift
//  QATestUITests
//
//  Created by ana.silva.dos.santos on 27/09/2018.
//  Copyright © 2018 Youse. All rights reserved.
//

import XCTest

class OnboardingViewUiTests: XCTestCase {
    
    let app = XCUIApplication()

    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    func swipeLeft(){
        let element2 = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        let element = element2.children(matching: .other).element.children(matching: .other).element
        element.swipeLeft()
    }
    
    func testWhenViewIsLaunched_shouldDisplayInitialState() {
        let numberOne = app.staticTexts["page_number_1"]
        XCTAssertEqual(numberOne.exists, true)
    }
    
    func testWhenViewIsLaunched_shouldDisplayTextHiInitialState() {
        let hi_Text = app.staticTexts["Oi"]
        XCTAssertEqual(hi_Text.label, "Oi")
    }
    
    func testWhenViewIsLaunched_shouldDisplayTextWelcomeInitialState() {
        swipeLeft()
        let welcome = app.staticTexts["Bem vindo"]
        XCTAssertEqual(welcome.label, "Bem vindo")
    }
    
    func testWhenViewIsLaunched_shouldDisplayNumberTwoInitialState() {
        swipeLeft()
        let numberTwo = app.staticTexts["page_number_2"]
        XCTAssertEqual(numberTwo.exists, true)
    }
    
    func testWhenViewIsLaunched_shouldDisplayNumberThreeInitialState() {
        swipeLeft()
        swipeLeft()
        let numberThree = app.staticTexts["page_number_3"]
        XCTAssertEqual(numberThree.exists, true)
    }
    
    func testshouldTapButtonAccess() {
        swipeLeft()
        swipeLeft()
        let buttonAccess = app.buttons["page_number_3_button"]
        buttonAccess.tap()
    }


  

}
