//
//  LoginViewModelTests.swift
//  LoginFormTests
//
//  Created by Cesar Paiva on 11/11/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import XCTest

@testable import LoginForm

class LoginViewModelTests: XCTestCase {
    
    fileprivate var mockLoginViewController: MockLoginViewController!
    fileprivate var sut: LoginViewModel!
    fileprivate var validUserName = "abcdefghij"
    fileprivate var invalidUserName = "a"
    fileprivate var validPassword = "D%io7AFn9Y"
    fileprivate var invalidPassword = "123"

    override func setUp() {
        super.setUp()
        mockLoginViewController = MockLoginViewController()
        sut = LoginViewModel(view: mockLoginViewController!)
    }

    override func tearDown() {
        super.tearDown()
        mockLoginViewController = nil
        sut = nil
    }

}

// MARK: initialization tests
extension LoginViewModelTests {
    
    func testInit_ValidView_InstantiatesObject() {
        
        
        XCTAssertNotNil(sut)
    }
    
    func testInit_ValidView_CopiesViewToIvar() {
        
        
        if let lhs = mockLoginViewController, let rhs = sut.view as? MockLoginViewController {
            XCTAssertTrue(lhs === rhs)
        }
        
    }

}

// MARK: performInitialViewSetup tests
extension LoginViewModelTests {
    
    func testPerformInitialViewSetup_Calls_ClearUserNameField_OnViewController() {

        let expectation = self.expectation(description: "expected clearUserNameField() to be called")
        mockLoginViewController!.expectationForClearUserNameField = expectation

        sut.performInitialViewSetup()

        waitForExpectations(timeout: 1.0, handler: nil)

    }
    
    func testPerformInitialViewSetup_Calls_ClearPasswordField_OnViewController() {
        
        let expectation = self.expectation(description: "expected clearPasswordField() to be called")
        mockLoginViewController!.expectationForClearPasswordField = expectation
        
        sut.performInitialViewSetup()
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testPerformInitialViewSetup_Calls_DisablesLoginButton_OnViewController() {
        
        let expectation = self.expectation(description: "expected enableLoginButton(false) to be called")
        mockLoginViewController!.expectationForEnableLoginButton = (expectation, false)
        
        sut.performInitialViewSetup()
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testPerformInitialViewSetup_Calls_EnableCreateAccountButton_OnViewController() {
        
        let expectation = self.expectation(description: "expected enableCreateAccountButton(true) to be called")
        mockLoginViewController!.expectationForCreateAccountButton = (expectation, true)
        
        sut.performInitialViewSetup()
        
        waitForExpectations(timeout: 1.0, handler: nil)
        
    }
    
}

// MARK: didEndOnExit tests
extension LoginViewModelTests {
    
    func testUserNameDidEndOnExit_Calls_HideKeyboard_OnViewController() {
        
        let expectation = self.expectation(description: "expected hideKeyboard() to be called")
        mockLoginViewController!.expectationForHideKeyboard = expectation
        
        sut.userNameDidEndOnExit()
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testPasswordDidOnExit_Calls_HideKeyboard_OnViewController() {
        
        let expectation = self.expectation(description: "expected hideKeyboard() to be called")
        mockLoginViewController!.expectationForHideKeyboard = expectation
        
        sut.passwordDidEndOnExit()
        
        waitForExpectations(timeout: 1.0, handler: nil)
        
    }
    
}

// MARK: userNameUpdated tests
extension LoginViewModelTests {
    
    func testUserNameUpdated_Calls_Validate_OnUserNameValidator() {
        
        let expectation = self.expectation(description: "expected validate() to be called")
        
        sut.userNameValidator = MockUserNameValidator(expectation, expectedValue: validUserName)
        sut.userNameUpdated(validUserName)
        
        waitForExpectations(timeout: 1.0, handler: nil)
        
    }
    
    func testUserNameUpdated_ValidUserName_PasswordValidated_EnablesLoginButton_OnViewController() {
        
        let expectation = self.expectation(description: "expected enableLogin(true) to be called")
        mockLoginViewController!.expectationForEnableLoginButton = (expectation, true)
        
        sut.passwordValidated = true
        sut.userNameUpdated(validUserName)
        
        waitForExpectations(timeout: 1.0, handler: nil)

    }
    
    func testUserNameUpdated_ValidUserName_PasswordNotValidated_DisablesLoginButton_OnViewController() {
        
        let expectation = self.expectation(description: "expected enableLogin(false) to be called")
        mockLoginViewController!.expectationForEnableLoginButton = (expectation, false)
        
        sut.passwordValidated = false
        sut.userNameUpdated(validUserName)
        
        waitForExpectations(timeout: 1.0, handler: nil)

    }
    
    func testUserNameUpdated_InvalidUserName_PasswordValidated_DisablesLoginButton_OnViewController() {
        
        let expectation = self.expectation(description: "expected enableLogin(false) to be called")
        mockLoginViewController.expectationForEnableLoginButton = (expectation, false)
        
        sut.passwordValidated = true
        sut.userNameUpdated(invalidUserName)
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testUserNameUpdated_InvalidUserName_PasswordNotValidated_DisablesLoginButton_OnViewController() {
        
        let expectation = self.expectation(description: "expected enableLogin(false) to be called")
        mockLoginViewController.expectationForEnableLoginButton = (expectation, false)
        
        sut.passwordValidated = false
        sut.userNameUpdated(invalidUserName)
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
}

// MARK: passwordUpdated tests
extension LoginViewModelTests {
    
    func testPasswordUpdated_Calls_Validate_OnPasswordValidator() {
        
        let expectation = self.expectation(description: "expected validate() to be called")
        sut.passwordValidator = MockPasswordValidator(expectation, expectedValue: validPassword)
        sut.passwordUpdated(validPassword)
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testPasswordUpdated_ValidPassword_UserNameValidated_EnablesLoginButton_OnViewController() {
        
        let expectation = self.expectation(description: "expected enableLogin(true) to be called")
        mockLoginViewController.expectationForEnableLoginButton = (expectation, true)
        
        sut.userNameValidated = true
        sut.passwordUpdated(validPassword)
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testPasswordUpdated_ValidPassword_UserNameNotValidated_DisablesLoginButton_OnViewController() {
        
        let expectation = self.expectation(description: "expected enableLogin(false) to be called")
        mockLoginViewController.expectationForEnableLoginButton = (expectation, false)
        
        sut.userNameValidated = false
        sut.passwordUpdated(validPassword)
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testPasswordUpdated_InvalidPassword_UserNameValidated_DisablesLoginButton_OnViewController() {
        
        let expectation = self.expectation(description: "expected enableLogin(false) to be called")
        mockLoginViewController.expectationForEnableLoginButton = (expectation, false)
        
        sut.userNameValidated = true
        sut.passwordUpdated(invalidPassword)
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testPasswordUpdated_InvalidPassword_UserNameNotValidated_DisablesLoginButton_OnViewController() {
        
        let expectation = self.expectation(description: "expected enableLogin(false) to be called")
        mockLoginViewController.expectationForEnableLoginButton = (expectation, false)
        
        sut.userNameValidated = false
        sut.passwordUpdated(invalidPassword)
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
}


// MARK: login tests
extension LoginViewModelTests {
    
    func testLogin_ValidParameters_Calls_doLogin_OnLoginController() {
        
        let expectation = self.expectation(description: "expected doLogin() to be called")
        let mockLoginController = MockLoginController(expectation, expectedUserName: validUserName, expectedPassword: validPassword)
        mockLoginController.shouldReturnTrueOnLogin = true
        
        sut.loginController = mockLoginController
        mockLoginController.loginControllerDelegate = sut
        
        sut.login(userName: validUserName, password: validPassword)
        
        waitForExpectations(timeout: 1.0, handler: nil)
        
    }
    
}
