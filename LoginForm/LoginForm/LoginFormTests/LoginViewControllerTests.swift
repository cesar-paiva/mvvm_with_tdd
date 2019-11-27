//
//  LoginViewControllerTests.swift
//  LoginFormTests
//
//  Created by Cesar Paiva on 22/11/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import XCTest
@testable import LoginForm

class LoginViewControllerTests: XCTestCase {
    
    fileprivate var sut: LoginViewController!
    fileprivate var viewModel: MockLoginViewModel!
    
    fileprivate var validUserName = "abcdefghij"
    fileprivate let validPassword = "D%io7AFn9Y"

    override func setUp() {
        super.setUp()
        sut = LoginViewController()
        viewModel = MockLoginViewModel(view: sut)
    }

    override func tearDown() {
        super.tearDown()
        sut = nil
        viewModel = nil
    }
    
    func testViewDidLoad_Calls_PerformInitialSetup_OnViewModel() {
        
        let expectation = self.expectation(description: "expected performInitialViewSetup() to be called")


        viewModel.performInitialViewSetupExpectation = expectation
        
        sut.viewModel = viewModel
        
        sut.viewDidLoad()
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testUserNameDidOnExit_Calls_UserNameDidOnExit_OnViewModel() {
        
        let expectation = self.expectation(description: "expected userNameDidEndOnExit() to be called")


        viewModel.userNameDidOnExitExpectation = expectation
        
        sut.viewModel = viewModel
        
        sut.userNameDidEndOnExit(self)
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func testPasswordDidEndOnExit_Calls_PasswordDidEndOnExit_OnViewModel() {
        
        let expectation = self.expectation(description: "expected userNameDidEndOnExit() to be called")


        viewModel.passwordDidOnExitExpectation = expectation
        
        sut.viewModel = viewModel
        
        sut.passwordDidEndOnExit(self)
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testLogin_ValidUserNameAndPassword_Calls_Login_OnViewModel_WithExpectedUserName() {
        
        let expectation = self.expectation(description: "expected login() to be called")
        
        let userNameTextFieldStub = UITextFieldStub(text: validUserName)
        let passwordTextFieldStub = UITextFieldStub(text: "")

        sut.userNameTextField = userNameTextFieldStub
        sut.passwordTextField = passwordTextFieldStub

        viewModel.loginExpectation = (expectation, expectedUserName: validUserName, expectedPassword: "")
        
        sut.viewModel = viewModel
        sut.login(self)
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testLogin_ValidUserNameAndPassword_Calls_Login_OnViewModel_WithExpectedPassword() {
        
        let expectation = self.expectation(description:"expected login() to be called")
        
        let userNameTextFieldStub = UITextFieldStub(text:"")
        let passwordTextFieldStub = UITextFieldStub(text:validPassword)

        sut.userNameTextField = userNameTextFieldStub
        sut.passwordTextField = passwordTextFieldStub
        
        viewModel.loginExpectation = (expectation, expectedUserName:"",
                                      expectedPassword:validPassword)
        sut.viewModel = viewModel
        sut.login(self)
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func testTextFieldShouldChangeCaracters_userNameTextField_Calls_UserNameUpdated_OnViewModel_WithExpectedUserName() {
        
        let expectation = self.expectation(description: "expected userNameUpdated() to be called")
        
        let userNameTextFieldStub = UITextFieldStub(text:validUserName)
        let passwordTextFieldStub = UITextFieldStub(text:validPassword)

        sut.userNameTextField = userNameTextFieldStub
        sut.passwordTextField = passwordTextFieldStub

        viewModel.userNameUpdatedExpectation = (expectation, expectedValue: validUserName)
        
        sut.viewModel = viewModel
        
        let _ = sut.textField(userNameTextFieldStub, shouldChangeCharactersIn: NSRange(location: 0, length: 1), replacementString: "A")
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testTextFieldShouldChangeCharacters_passwordTextField_Calls_PasswordUpdated_OnViewModel_WithExpectedUsername() {
        
        let expectation = self.expectation(description: "expected passwordUpdated() to be called")
        
        let userNameTextFieldStub = UITextFieldStub(text:validUserName)
        let passwordTextFieldStub = UITextFieldStub(text:validPassword)

        sut.userNameTextField = userNameTextFieldStub
        sut.passwordTextField = passwordTextFieldStub
        
        viewModel.passwordUpdatedExpectation = (expectation,
                                                expectedValue:validPassword)
        sut.viewModel = viewModel
        
        let _ = sut.textField(passwordTextFieldStub, shouldChangeCharactersIn:NSMakeRange(0, 1), replacementString: "A")
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
}
