//
//  MockSignupViewController.swift
//  LoginFormTests
//
//  Created by Cesar Paiva on 16/11/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import Foundation
import XCTest
@testable import LoginForm

class MockSignupViewController: SignupViewControllerProtocol {

    var expectationForClearUserNameField: XCTestExpectation?
    var expectationForClearPasswordField: XCTestExpectation?
    var expectationForClearConfirmPasswordField: XCTestExpectation?
    var expectationForEnableCreateButton: (XCTestExpectation, Bool)?
    var expectationForEnableCancelButton: (XCTestExpectation, Bool)?
    var expectationForHideKeyboard: XCTestExpectation?
    var expectationForSignup: XCTestExpectation?
    var expectationForSignupResult: (XCTestExpectation, Bool)?

    func clearUserNameField() {
        expectationForClearUserNameField?.fulfill()
    }
    
    func clearPasswordField() {
        expectationForClearPasswordField?.fulfill()
    }
    
    func clearConfirmPasswordField() {
        expectationForClearConfirmPasswordField?.fulfill()
    }
    
    func enableCreateButton(_ status: Bool) {
        if let (expectation, expectedValue) = expectationForEnableCreateButton {
            if status == expectedValue {
                expectation.fulfill()
            }
        }
    }
    
    func enableCancelButton(_ status: Bool) {
        if let (expectation, expectedValue) = expectationForEnableCancelButton {
            if status == expectedValue {
                expectation.fulfill()
            }
        }
    }
    
    func hideKeyboard() {
        expectationForHideKeyboard?.fulfill()
    }
    
    func signup(model: SignupModel) {
        expectationForSignup?.fulfill()
    }
    
    func signupResult(result: Bool) {
        if let (expectation, expectedResult) = expectationForSignupResult {
            if result == expectedResult {
                expectation.fulfill()
            }
        }
    }
    
}
