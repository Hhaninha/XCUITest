//  LoginViewUiTests.swift
//  QATestUITests
//  Created by ana.silva.dos.santos on 27/09/2018.
//  Copyright © 2018 Youse. All rights reserved.

import XCTest

class LoginViewUiTests: XCTestCase {
    
    let app = XCUIApplication()
    
    
    func swipeLeft(){
        let element = app.children(matching: .window).element(boundBy: 0).children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element.children(matching: .other).element
        element.children(matching: .other).element.children(matching: .other).element.swipeLeft()
        element.children(matching: .other).element(boundBy: 0).children(matching: .other).element.swipeLeft()
    }
    
    func tapButtonAcess() {
        let buttonAcess = app/*@START_MENU_TOKEN@*/.buttons["page_number_3_button"]/*[[".buttons[\"Acessar\"]",".buttons[\"page_number_3_button\"]"],[[[-1,1],[-1,0]]],[0]]@END_MENU_TOKEN@*/
        buttonAcess.tap();
    }

    override func setUp() {
        continueAfterFailure = false
        XCUIApplication().launch()
    }
    
    func testLoginSucess() {
        swipeLeft()
        tapButtonAcess()
        let emailTextField = app.textFields["email_textfield"]
        let email = "youser1@youse.com.br"
        emailTextField.tap()
        emailTextField.typeText(email)
        XCTAssertEqual(emailTextField.value as? String, email)
        XCUIApplication()/*@START_MENU_TOKEN@*/.buttons["verify_email_button"]/*[[".otherElements[\"email_view\"]",".buttons[\"Prosseguir\"]",".buttons[\"verify_email_button\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        let passwordTextField =  app.secureTextFields["password_textfield"]
        let password = "12345678"
        passwordTextField.tap()
        passwordTextField.typeText(password)
        app/*@START_MENU_TOKEN@*/.buttons["login_button"]/*[[".otherElements[\"password_view\"]",".buttons[\"Logar\"]",".buttons[\"login_button\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        let welcome = app.staticTexts["greeting_label"]
        welcome.waitForExistence(timeout: 2)
    }

    func testWhenViewIsLaunched_shouldDisplayEmailInitialState() {
        swipeLeft()
        tapButtonAcess()
        let email = app.textFields["email_textfield"]
        XCTAssertEqual(email.exists,true )
    }
    
    func testWhenViewIsLaunched_shouldDisplayButtonProceedInitialState() {
        swipeLeft()
        tapButtonAcess()
        let buttonProceed = app.buttons["verify_email_button"]
        XCTAssertEqual(buttonProceed.exists,true )
    }
    
    func testDisplayEmailError() {
        swipeLeft()
        tapButtonAcess()
        app/*@START_MENU_TOKEN@*/.buttons["verify_email_button"]/*[[".otherElements[\"email_view\"]",".buttons[\"Prosseguir\"]",".buttons[\"verify_email_button\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        let emailTextError = app.staticTexts["email_error_label"]
        XCTAssertEqual(emailTextError.exists,true )
    }
    
    func testShouldDisplayPasswordError() {
        swipeLeft()
        tapButtonAcess()
        let emailTextField = app.textFields["email_textfield"]
        let email = "youser1@youse.com.br"
        emailTextField.tap()
        emailTextField.typeText(email)
        app/*@START_MENU_TOKEN@*/.buttons["verify_email_button"]/*[[".otherElements[\"email_view\"]",".buttons[\"Prosseguir\"]",".buttons[\"verify_email_button\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        app.buttons["login_button"].tap()
        let passwordTextError = app.staticTexts["password_error_label"]
        XCTAssertEqual(passwordTextError.exists,true )
    }
    
    func testShouldDisplayEmailLabel(){
        swipeLeft()
        tapButtonAcess()
        let emailLabel = app.staticTexts["email_label"]
        XCTAssertEqual(emailLabel.exists,true )
    }
    
    func testShouldDisplayPasswordLabel(){
        swipeLeft()
        tapButtonAcess()
        let emailTextField = app.textFields["email_textfield"]
        let email = "youser1@youse.com.br"
        emailTextField.tap()
        emailTextField.typeText(email)
        app/*@START_MENU_TOKEN@*/.buttons["verify_email_button"]/*[[".otherElements[\"email_view\"]",".buttons[\"Prosseguir\"]",".buttons[\"verify_email_button\"]"],[[[-1,2],[-1,1],[-1,0,1]],[[-1,2],[-1,1]]],[0]]@END_MENU_TOKEN@*/.tap()
        let passWordLabel = app.staticTexts["password_label"]
        XCTAssertEqual(passWordLabel.exists,true )
    }
}
