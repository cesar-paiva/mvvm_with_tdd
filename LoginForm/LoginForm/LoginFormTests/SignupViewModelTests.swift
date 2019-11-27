//
//  SignupViewModelTests.swift
//  LoginFormTests
//
//  Created by Cesar Paiva on 16/11/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import XCTest
@testable import LoginForm

class SignupViewModelTests: XCTestCase {
    
    fileprivate var mockSignupViewController: MockSignupViewController!
    fileprivate var sut: SignupViewModel!
    fileprivate var validUserName = "Alibaba"
    fileprivate var invalidUserName = "a"
    fileprivate let validPassword = "D%io7AFn9Y"
    fileprivate let validPassword2 = "B%un9AG91A"
    fileprivate let invalidPassword = "a3$Am"
    fileprivate let validEmailAddress = "a@b.com"
    fileprivate let invalidEmailAddress = "tdd.com"
    
    override func setUp() {
        super.setUp()
        mockSignupViewController = MockSignupViewController()
        sut = SignupViewModel(view: mockSignupViewController)
    }

    override func tearDown() {
        super.tearDown()
        mockSignupViewController = nil
        sut = nil
    }

}

// MARK: initialization tests
extension SignupViewModelTests {
    
    func testInit_ValidView_InstantiateObject() {

        XCTAssertNotNil(sut)
        
    }
    
    func testInit_ValidView_CopiesViewToVar() {

        
        if let mockSignupViewController = mockSignupViewController, let view = sut.view as? MockSignupViewController {
            XCTAssertTrue(mockSignupViewController === view)
        }
    }
}

// MARK: performInitialViewSetup tests
extension SignupViewModelTests {
    
    func testPerformInitialViewSetup_Calls_ClearUserNameField_OnViewController() {
        
        let expectation = self.expectation(description: "expected clearUserNameField() to be called")
        mockSignupViewController.expectationForClearUserNameField = expectation

        sut.performInitialViewSetup()
        
        waitForExpectations(timeout: 1.0, handler: nil)
        
    }
    
    func testPerformInitialViewSetup_Calls_ClearPasswordField_OnViewController() {
        
        let expectation = self.expectation(description: "expected clearPasswordField() to be called")
        mockSignupViewController.expectationForClearPasswordField = expectation

        sut.performInitialViewSetup()
        
        waitForExpectations(timeout: 1.0, handler: nil)
        
    }
    
    func testPerformInitialViewSetup_Calls_ClearConfirmPasswordField_OnViewController() {
        
        let expectation = self.expectation(description: "expected clearConfirmPasswordField() to be called")
        mockSignupViewController.expectationForClearConfirmPasswordField = expectation

        sut.performInitialViewSetup()
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testPerformInitalViewSetup_DisablesCreateButton_OnViewController() {
        
        let expectation = self.expectation(description: "expected enableCreateButton(false) to be called")
        mockSignupViewController.expectationForEnableCreateButton = (expectation, false)

        sut.performInitialViewSetup()
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testPerformInitialViewSetup_EnablesCancelButton_OnViewController() {
        
        let expectation = self.expectation(description: "expected enableCancelButton(true) to be called")
        mockSignupViewController.expectationForEnableCancelButton = (expectation, true)

        sut.performInitialViewSetup()
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
}

// MARK: userNameDidEndOnExit tests
extension SignupViewModelTests {
    
    func testUserNameDidEndOnExit_Calls_HideKeyboard_OnViewController() {
        let expectation = self.expectation(description: "expected hideKeyboard() to be called")
        mockSignupViewController.expectationForHideKeyboard = expectation
        
        let viewModel = SignupViewModel(view:mockSignupViewController)
        viewModel.userNameDidEndOnExit()
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
}

// MARK: passwordDidEndOnExit tests
extension SignupViewModelTests {
    
    func testPasswordDidEndOnExit_Calls_HideKeyboard_OnViewController() {
        let expectation = self.expectation(description: "expected hideKeyboard() to be called")
        mockSignupViewController.expectationForHideKeyboard = expectation
        
        let viewModel = SignupViewModel(view:mockSignupViewController)
        viewModel.passwordDidEndOnExit()
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
}

// MARK: emailAddressDidEndOnExit tests
extension SignupViewModelTests {
    
    func testEmailAddressDidEndOnExit_Calls_HideKeyboard_OnViewController() {
        let expectation = self.expectation(description: "expected hideKeyboard() to be called")
        mockSignupViewController.expectationForHideKeyboard = expectation
        
        let viewModel = SignupViewModel(view:mockSignupViewController)
        viewModel.emailAddressDidEndOnExit()
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
}

// MARK: confirmPasswordDidEndOnExit tests
extension SignupViewModelTests {
    
    func testConfirmPasswordDidEndOnExit_Calls_HideKeyboard_OnViewController() {
        let expectation = self.expectation(description: "expected hideKeyboard() to be called")
        mockSignupViewController.expectationForHideKeyboard = expectation
        
        let viewModel = SignupViewModel(view:mockSignupViewController)
        viewModel.confirmPasswordDidEndOnExit()
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
}

// MARK: userNameUpdated tests
extension SignupViewModelTests {
    
    func testUserNameUpdated_Calls_Validate_OnUserNameValidator() {
        let expectation = self.expectation(description: "expected validate() to be called")
        
        let viewModel = SignupViewModel(view:mockSignupViewController)
        viewModel.userNameValidator = MockUserNameValidator(expectation, expectedValue: validUserName)
        
        viewModel.userNameUpdated(validUserName)
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testUserNameUpdated_ValidUserName_PasswordsValidatedAndEqual_ValidEmailAddress_EnablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableCreateButton(true) to be called")
        mockSignupViewController.expectationForEnableCreateButton = (expectation, true)
        
        let viewModel = SignupViewModel(view:mockSignupViewController)
        viewModel.password1Validated = true
        viewModel.password2Validated = true
        viewModel.passwordsAreIdentical = true
        viewModel.emailAddressValidated = true
        
        viewModel.userNameUpdated(validUserName)
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testUserNameUpdated_ValidUserName_PasswordsValidatedButNotEqual_DisablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableCreateButton(false) to be called")
        mockSignupViewController.expectationForEnableCreateButton = (expectation, false)
        
        let viewModel = SignupViewModel(view:mockSignupViewController)
        viewModel.password1Validated = true
        viewModel.password2Validated = true
        viewModel.passwordsAreIdentical = false
        viewModel.userNameUpdated(validUserName)
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testUserNameUpdated_NilValue_DisablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableCreateButton(false) to be called")
        mockSignupViewController!.expectationForEnableCreateButton = (expectation, false)
        
        let viewModel = SignupViewModel(view:mockSignupViewController)
        viewModel.userNameUpdated(nil)
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testUserNameUpdated_ValidUserName_Password1NotValidated_DisablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableLogin(false) to be called")
        mockSignupViewController.expectationForEnableCreateButton = (expectation, false)
        
        let viewModel = SignupViewModel(view:mockSignupViewController)
        viewModel.password1Validated = false
        
        viewModel.userNameUpdated(validUserName)
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testUserNameUpdated_ValidUserName_Password2NotValidated_DisablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableLogin(false) to be called")
        mockSignupViewController.expectationForEnableCreateButton = (expectation, false)
        
        let viewModel = SignupViewModel(view:mockSignupViewController)
        viewModel.password2Validated = false
        
        viewModel.userNameUpdated(validUserName)
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    func testUserNameUpdated_InvalidUserName_PasswordsValidatedAndEqual_DisablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableLogin(false) to be called")
        mockSignupViewController.expectationForEnableCreateButton = (expectation, false)
        
        let viewModel = SignupViewModel(view:mockSignupViewController)
        viewModel.password1Validated = true
        viewModel.password2Validated = true
        viewModel.passwordsAreIdentical = true
        
        viewModel.userNameUpdated(invalidUserName)
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testUserNameUpdated_InvalidUserName_PasswordsValidatedButNotEqual_DisablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableLogin(false) to be called")
        mockSignupViewController.expectationForEnableCreateButton = (expectation, false)
        
        let viewModel = SignupViewModel(view:mockSignupViewController)
        viewModel.password1Validated = true
        viewModel.password2Validated = true
        viewModel.passwordsAreIdentical = false
        
        viewModel.userNameUpdated(invalidUserName)
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    func testUserNameUpdated_InvalidUserName_Password1NotValidated_DisablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableLogin(false) to be called")
        mockSignupViewController.expectationForEnableCreateButton = (expectation, false)
        
        let viewModel = SignupViewModel(view:mockSignupViewController)
        viewModel.password1Validated = false
        
        viewModel.userNameUpdated(invalidUserName)
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testUserNameUpdated_InvalidUserName_Password2NotValidated_DisablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableLogin(false) to be called")
        mockSignupViewController.expectationForEnableCreateButton = (expectation, false)
        
        let viewModel = SignupViewModel(view:mockSignupViewController)
        viewModel.password2Validated = false
        
        viewModel.userNameUpdated(invalidUserName)
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }

}

// MARK: emailAddressUpdated tests
extension SignupViewModelTests {
    
    func testEmailAddressUpdated_Calls_Validate_OnEmailAddressValidator() {
        let expectation = self.expectation(description: "expected validate() to be called")
        
        let viewModel = SignupViewModel(view:mockSignupViewController)
        viewModel.emailAddressValidator = MockEmailAddressValidator(expectation, expectedValue: validEmailAddress)
        
        viewModel.emailAddressUpdated(validEmailAddress)
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testEmailAddressUpdated_ValidEmailAddress_PasswordsValidatedAndEqual_UserNameValidated_EnablesCreateButton_OnViewController() {
        
        let expectation = self.expectation(description: "expected enableCreateButton(true) to be called")
        mockSignupViewController.expectationForEnableCreateButton = (expectation, true)
        
        let viewModel = SignupViewModel(view:mockSignupViewController)
        viewModel.userNameValidated = true
        viewModel.password1Validated = true
        viewModel.password2Validated = true
        viewModel.passwordsAreIdentical = true
        
        viewModel.emailAddressUpdated(validEmailAddress)
        
        waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testEmailAddressUpdated_ValidEmailAddress_Passwords1Validated_Password2NotValidated_UserNameValidated_DisablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableCreateButton(false) to be called")
        mockSignupViewController.expectationForEnableCreateButton = (expectation, false)
        
        let viewModel = SignupViewModel(view:mockSignupViewController)
        viewModel.userNameValidated = true
        viewModel.password1Validated = true
        viewModel.password2Validated = false
        viewModel.passwordsAreIdentical = false
        
        viewModel.emailAddressUpdated(validEmailAddress)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    func testEmailAddressUpdated_ValidEmailAddress_Passwords2Validated_Password1NotValidated_UserNameValidated_DisablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableCreateButton(false) to be called")
        mockSignupViewController.expectationForEnableCreateButton = (expectation, false)
        
        let viewModel = SignupViewModel(view:mockSignupViewController)
        viewModel.userNameValidated = true
        viewModel.password1Validated = false
        viewModel.password2Validated = true
        viewModel.passwordsAreIdentical = false
        
        viewModel.emailAddressUpdated(validEmailAddress)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    func testEmailAddressUpdated_ValidEmailAddress_PasswordsValidatedButNotEqual_UserNameValidated_DisablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableCreateButton(false) to be called")
        mockSignupViewController.expectationForEnableCreateButton = (expectation, false)
        
        let viewModel = SignupViewModel(view:mockSignupViewController)
        viewModel.userNameValidated = true
        viewModel.password1Validated = true
        viewModel.password2Validated = true
        viewModel.passwordsAreIdentical = false
        
        viewModel.emailAddressUpdated(validEmailAddress)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testEmailAddressUpdated_NilValue_DisablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableCreateButton(false) to be called")
        mockSignupViewController.expectationForEnableCreateButton = (expectation, false)
        
        let viewModel = SignupViewModel(view:mockSignupViewController)
        viewModel.emailAddressUpdated(nil)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testEmailAddressUpdated_ValidEmailAddress_PasswordsValidatedAndEqual_UserNameNotValidated_DisablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableCreateButton(false) to be called")
        mockSignupViewController.expectationForEnableCreateButton = (expectation, false)
        
        let viewModel = SignupViewModel(view:mockSignupViewController)
        viewModel.userNameValidated = false
        viewModel.password1Validated = true
        viewModel.password2Validated = true
        viewModel.passwordsAreIdentical = true
        
        viewModel.emailAddressUpdated(validEmailAddress)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testEmailAddressUpdated_InValidEmailAddress_DisablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableCreateButton(false) to be called")
        mockSignupViewController!.expectationForEnableCreateButton = (expectation, false)
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.emailAddressUpdated(invalidEmailAddress)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
}

// MARK: passwordUpdated tests
extension SignupViewModelTests {
    
    func testPasswordUpdated_Calls_Validate_OnPasswordValidator() {
        let expectation = self.expectation(description: "expected validate() to be called")
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.passwordValidator = MockPasswordValidator(expectation, expectedValue: validPassword)
        
        viewModel.passwordUpdated(validPassword)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testPasswordUpdated_ValidAndEqualPassword1AndPassword2_UserNameValidated_Password2Validated_EnablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableCreateButton(true) to be called")
        mockSignupViewController!.expectationForEnableCreateButton = (expectation, true)
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.password2 = validPassword
        viewModel.userNameValidated = true
        viewModel.password2Validated = true
        viewModel.passwordUpdated(validPassword)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testPasswordUpdated_ValidPassword_UserNameNotValidated_DisablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableCreateButton(false) to be called")
        mockSignupViewController!.expectationForEnableCreateButton = (expectation, false)
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.passwordUpdated(validPassword)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testPasswordUpdated_NilValue_DisablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableCreateButton(false) to be called")
        mockSignupViewController!.expectationForEnableCreateButton = (expectation, false)
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.passwordUpdated(nil)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testPasswordUpdated_InvalidPassword_Password1NotValidated_DisablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableCreateButton(false) to be called")
        mockSignupViewController!.expectationForEnableCreateButton = (expectation, false)
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.password1Validated = false
        
        viewModel.passwordUpdated(invalidPassword)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testPasswordUpdated_InvalidPassword_Password2NotValidated_DisablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableCreateButton(false) to be called")
        mockSignupViewController!.expectationForEnableCreateButton = (expectation, false)
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.password2Validated = false
        
        viewModel.passwordUpdated(invalidPassword)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    func testPasswordUpdated_InvalidPassword_PasswordsNotValidatedAndNotEqual_DisablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableCreateButton(false) to be called")
        mockSignupViewController!.expectationForEnableCreateButton = (expectation, false)
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.password2Validated = false
        viewModel.passwordUpdated(invalidPassword)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testPasswordUpdated_ValidPassword_PasswordsValidatedButNotEqual_DisablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableCreateButton(false) to be called")
        mockSignupViewController!.expectationForEnableCreateButton = (expectation, false)
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.password2Validated = true
        viewModel.password2 = validPassword2
        viewModel.passwordUpdated(validPassword)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testPasswordUpdated_InvalidPassword_Password2NotValidated_UserNameValidated_DisablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableCreateButton(false) to be called")
        mockSignupViewController!.expectationForEnableCreateButton = (expectation, false)

        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.password2Validated = false
        viewModel.userNameValidated = true
        viewModel.passwordUpdated(invalidPassword)

        self.waitForExpectations(timeout: 1.0, handler: nil)
    }

}

// MARK: confirmPasswordUpdated tests
extension SignupViewModelTests {
    
    func testConfirmPasswordUpdated_Calls_Validate_OnPasswordValidator() {
        let expectation = self.expectation(description: "expected validate() to be called")
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.passwordValidator = MockPasswordValidator(expectation, expectedValue: validPassword)
        
        viewModel.confirmPasswordUpdated(validPassword)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testConfirmPasswordUpdated_ValidAndEqualPassword1AndPassword2_UserNameValidated_Password1Validated_EnablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableCreateButton(true) to be called")
        mockSignupViewController!.expectationForEnableCreateButton = (expectation, true)
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.password1 = validPassword
        viewModel.password1Validated = true
        viewModel.userNameValidated = true
        viewModel.confirmPasswordUpdated(validPassword)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testConfirmPasswordUpdated_ValidPassword_UserNameNotValidated_DisablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableCreateButton(false) to be called")
        mockSignupViewController!.expectationForEnableCreateButton = (expectation, false)
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.confirmPasswordUpdated(validPassword)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testConfirmPasswordUpdated_NilValue_DisablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableCreateButton(false) to be called")
        mockSignupViewController!.expectationForEnableCreateButton = (expectation, false)
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.confirmPasswordUpdated(nil)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testConfirmPasswordUpdated_InvalidPassword_Password1NotValidated_DisablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableCreateButton(false) to be called")
        mockSignupViewController!.expectationForEnableCreateButton = (expectation, false)
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.password1Validated = false
        
        viewModel.confirmPasswordUpdated(invalidPassword)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testConfirmPasswordUpdated_InvalidPassword_Password2NotValidated_DisablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableCreateButton(false) to be called")
        mockSignupViewController!.expectationForEnableCreateButton = (expectation, false)
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.password2Validated = false
        
        viewModel.confirmPasswordUpdated(invalidPassword)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    
    func testConfirmPasswordUpdated_InvalidPassword_PasswordsNotValidatedAndNotEqual_DisablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableCreateButton(false) to be called")
        mockSignupViewController!.expectationForEnableCreateButton = (expectation, false)
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.password2Validated = false
        viewModel.confirmPasswordUpdated(invalidPassword)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testConfirmPasswordUpdated_ValidPassword_PasswordsValidatedButNotEqual_DisablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableCreateButton(false) to be called")
        mockSignupViewController!.expectationForEnableCreateButton = (expectation, false)
        
        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.password2Validated = true
        viewModel.password2 = validPassword2
        viewModel.confirmPasswordUpdated(validPassword)
        
        self.waitForExpectations(timeout: 1.0, handler: nil)
    }
    
    func testConfirmPasswordUpdated_InvalidPassword_Password2NotValidated_UserNameValidated_DisablesCreateButton_OnViewController() {
        let expectation = self.expectation(description: "expected enableCreateButton(false) to be called")
        mockSignupViewController!.expectationForEnableCreateButton = (expectation, false)

        let viewModel = SignupViewModel(view:mockSignupViewController!)
        viewModel.password2Validated = false
        viewModel.userNameValidated = true
        viewModel.confirmPasswordUpdated(invalidPassword)

        waitForExpectations(timeout: 1.0, handler: nil)
    }

}

// MARK: signup test
extension SignupViewModelTests {
    
    func testSignup_ValidUserName_ValidPassword_ValidEmailAddress_Calls_SignupResultWithTrue_OnViewController() {
        
        let expectation = self.expectation(description: "expected signup to be called")
        mockSignupViewController?.expectationForSignupResult = (expectation, true)

        sut.signup(userName: validUserName, password: validPassword, emailAddress: validEmailAddress)
        
        waitForExpectations(timeout: 1.0, handler: nil)
        
    }
    
    
}
