//
//  SignupViewControllerTests.swift
//  LoginFormTests
//
//  Created by Cesar Paiva on 22/11/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import XCTest
@testable import LoginForm

class SignupViewControllerTests: XCTestCase {
    
    fileprivate var sut: SignupViewController!
    fileprivate var viewModel: MockSignupViewModel!
    
    fileprivate let validUserName = "abcdefghij"
    fileprivate let validPassword = "D%io7AFn9Y"
    fileprivate let validEmailAddress = "tdd@everis.com"

    override func setUp() {
        super.setUp()
        sut = SignupViewController()
        viewModel = MockSignupViewModel(view:sut)
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
    
    func testUserNameDidEndOnExit_Calls_UserNameDidEndOnExit_OnViewModel() {
        
        let expectation = self.expectation(description: "expected userNameDidEndOnExit() to be called")


        viewModel.userNameDidEndOnExitExpectation = expectation
        
        sut.viewModel = viewModel
        
        sut.userNameDidEndOnExit(self)
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testEmailAddressDidEndOnExit_Calls_EmailAddressDidEndOnExit_OnViewModel() {
        
        let expectation = self.expectation(description: "expected emailAddressDidEndOnExit() to be called")


        viewModel.emailAddressDidEndOnExitExpectation = expectation
        
        sut.viewModel = viewModel
        
        sut.emailAddressDidEndOnExit(self)
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }

    func testPasswordDidEndOnExit_Calls_PasswordDidEndOnExit_OnViewModel() {
        
        let expectation = self.expectation(description: "expected passwordDidEndOnExit() to be called")


        viewModel.passwordDidEndOnExitExpectation = expectation
        
        sut.viewModel = viewModel
        
        sut.passwordDidEndOnExit(self)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testConfirmPasswordDidEndOnExit_Calls_ConfirmPasswordDidEndOnExit_OnViewModel() {
        
        let expectation = self.expectation(description: "expected confirmPasswordDidEndOnExit() to be called")


        viewModel.confirmPasswordDidEndOnExitExpectation = expectation
        
        sut.viewModel = viewModel
        
        sut.confirmPasswordDidEndOnExit(self)
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testTextFieldShouldChangeCharacters_userNameTextField_Calls_UserNameUpdated_OnViewModel_WithExpectedUsername() {
        
        let expectation = self.expectation(description: "expected userNameUpdated() to be called")
        
        let userNameTextFieldStub = UITextFieldStub(text:validUserName)
        let passwordTextFieldStub = UITextFieldStub(text:validPassword)
        let confirmPasswordTextFieldStub = UITextFieldStub(text:validPassword)
        let emailAddressTextFieldStub = UITextFieldStub(text:validEmailAddress)

        sut.userNameTextField = userNameTextFieldStub
        sut.passwordTextField = passwordTextFieldStub
        sut.confirmPasswordTextField = confirmPasswordTextFieldStub
        sut.emailAddressTextField = emailAddressTextFieldStub

        viewModel.userNameUpdatedExpectation = (expectation, expectedValue:validUserName)
        
        sut.viewModel = viewModel
        
        let _ = sut.textField(userNameTextFieldStub,
                                              shouldChangeCharactersIn: NSMakeRange(0, 1),
                                              replacementString: "A")
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testTextFieldShouldChangeCharacters_passwordTextField_Calls_PasswordUpdated_OnViewModel_WithExpectedPassword() {
        
        let expectation = self.expectation(description: "expected passwordUpdated() to be called")
        
        let userNameTextFieldStub = UITextFieldStub(text:validUserName)
        let passwordTextFieldStub = UITextFieldStub(text:validPassword)
        let confirmPasswordTextFieldStub = UITextFieldStub(text:validPassword)
        let emailAddressTextFieldStub = UITextFieldStub(text:validEmailAddress)

        sut.userNameTextField = userNameTextFieldStub
        sut.passwordTextField = passwordTextFieldStub
        sut.confirmPasswordTextField = confirmPasswordTextFieldStub
        sut.emailAddressTextField = emailAddressTextFieldStub

        viewModel.passwordUpdatedExpectation = (expectation, expectedValue:validPassword)
        
        sut.viewModel = viewModel
        
        let _ = sut.textField(passwordTextFieldStub,
                                              shouldChangeCharactersIn: NSMakeRange(0, 1),
                                              replacementString: "A")
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }

    
    func testTextFieldShouldChangeCharacters_confirmPasswordTextField_Calls_ConfirmPasswordUpdated_OnViewModel_WithExpectedPassword() {
        
        let expectation = self.expectation(description: "expected confirmPasswordUpdated() to be called")
        
        let userNameTextFieldStub = UITextFieldStub(text:validUserName)
        let passwordTextFieldStub = UITextFieldStub(text:validPassword)
        let confirmPasswordTextFieldStub = UITextFieldStub(text:validPassword)
        let emailAddressTextFieldStub = UITextFieldStub(text:validEmailAddress)

        sut.userNameTextField = userNameTextFieldStub
        sut.passwordTextField = passwordTextFieldStub
        sut.confirmPasswordTextField = confirmPasswordTextFieldStub
        sut.emailAddressTextField = emailAddressTextFieldStub

        viewModel.confirmPasswordUpdatedExpectation = (expectation, expectedValue:validPassword)
    
        sut.viewModel = viewModel
        
        let _ = sut.textField(confirmPasswordTextFieldStub,
                                               shouldChangeCharactersIn: NSMakeRange(0, 1),
                                               replacementString: "A")
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }

    
    func testTextFieldShouldChangeCharacters_emailAddressTextField_Calls_EmailAddressUpdated_OnViewModel_WithExpectedPassword() {
        
        let expectation = self.expectation(description: "expected emailAddressUpdated() to be called")
        
        let userNameTextFieldStub = UITextFieldStub(text:validUserName)
        let passwordTextFieldStub = UITextFieldStub(text:validPassword)
        let confirmPasswordTextFieldStub = UITextFieldStub(text:validPassword)
        let emailAddressTextFieldStub = UITextFieldStub(text:validEmailAddress)

        sut.userNameTextField = userNameTextFieldStub
        sut.passwordTextField = passwordTextFieldStub
        sut.confirmPasswordTextField = confirmPasswordTextFieldStub
        sut.emailAddressTextField = emailAddressTextFieldStub

        viewModel.emailAddressUpdatedExpectation = (expectation, expectedValue:validEmailAddress)
        
        sut.viewModel = viewModel
        
        let _ = sut.textField(emailAddressTextFieldStub,
                                               shouldChangeCharactersIn: NSMakeRange(0, 1),
                                               replacementString: "A")
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    func testCreate_ValidUserNamePasswordEmailAddress_Calls_Signup_OnViewModel_WithExpectedUserName() {
        
        let expectation = self.expectation(description: "expected signup() to be called")
        
        let userNameTextFieldStub = UITextFieldStub(text:validUserName)
        let passwordTextFieldStub = UITextFieldStub(text:"")
        let confirmPasswordTextFieldStub = UITextFieldStub(text:"")
        let emailAddressTextFieldStub = UITextFieldStub(text:"")

        sut.userNameTextField = userNameTextFieldStub
        sut.passwordTextField = passwordTextFieldStub
        sut.confirmPasswordTextField = confirmPasswordTextFieldStub
        sut.emailAddressTextField = emailAddressTextFieldStub

        viewModel.signupExpectation = (expectation, expectedUserName:validUserName, expectedPassword:"", expectedEmailAddress:"")
        
        sut.viewModel = viewModel
        
        sut.create(self)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testCreate_ValidUserNamePasswordEmailAddress_Calls_Signup_OnViewModel_WithExpectedPassword() {
        
        let expectation = self.expectation(description: "expected signup() to be called")
        
        let userNameTextFieldStub = UITextFieldStub(text:"")
        let passwordTextFieldStub = UITextFieldStub(text:validPassword)
        let confirmPasswordTextFieldStub = UITextFieldStub(text:validPassword)
        let emailAddressTextFieldStub = UITextFieldStub(text:"")

        sut.userNameTextField = userNameTextFieldStub
        sut.passwordTextField = passwordTextFieldStub
        sut.confirmPasswordTextField = confirmPasswordTextFieldStub
        sut.emailAddressTextField = emailAddressTextFieldStub

        viewModel.signupExpectation = (expectation, expectedUserName:"", expectedPassword:validPassword, expectedEmailAddress:"")
        
        sut.viewModel = viewModel
        
        sut.create(self)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    func testCreate_ValidUserNamePasswordEmailAddress_Calls_Signup_OnViewModel_WithExpectedEmailAddress() {
        
        let expectation = self.expectation(description: "expected signup() to be called")
        
        let userNameTextFieldStub = UITextFieldStub(text:"")
        let passwordTextFieldStub = UITextFieldStub(text:"")
        let confirmPasswordTextFieldStub = UITextFieldStub(text:"")
        let emailAddressTextFieldStub = UITextFieldStub(text:validEmailAddress)

        sut.userNameTextField = userNameTextFieldStub
        sut.passwordTextField = passwordTextFieldStub
        sut.confirmPasswordTextField = confirmPasswordTextFieldStub
        sut.emailAddressTextField = emailAddressTextFieldStub

        viewModel.signupExpectation = (expectation, expectedUserName:"", expectedPassword:"", expectedEmailAddress:validEmailAddress)
        
        sut.viewModel = viewModel
        
        sut.create(self)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
}
