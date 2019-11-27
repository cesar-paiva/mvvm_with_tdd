//
//  MockLoginViewController.swift
//  LoginFormTests
//
//  Created by Cesar Paiva on 11/11/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import UIKit
import XCTest

@testable import LoginForm

class MockLoginViewController: LoginViewControllerProtocol {

    var expectationForClearUserNameField: XCTestExpectation?
    var expectationForClearPasswordField: XCTestExpectation?
    var expectationForEnableLoginButton: (XCTestExpectation, Bool)?
    var expectationForCreateAccountButton: (XCTestExpectation, Bool)?
    var expectationForHideKeyboard: XCTestExpectation?

    func clearUserNameField() {
        expectationForClearUserNameField?.fulfill()
    }
    
    func clearPasswordField() {
        expectationForClearPasswordField?.fulfill()
    }
    
    func enableLoginButton(_ status: Bool) {
        if let (expectation, expedtedValue) = expectationForEnableLoginButton {
            if status == expedtedValue {
                expectation.fulfill()
            }
        }
    }
    
    func enableCreateAccountButton(_ status: Bool) {
        if let (expectation, expectedValue) = expectationForCreateAccountButton {
            if status == expectedValue {
                expectation.fulfill()
            }
        }
    }
    
    func hideKeyboard() {
        expectationForHideKeyboard?.fulfill()
    }
    
    

    
}
