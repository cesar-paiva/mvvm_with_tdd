//
//  MockLoginViewModel.swift
//  LoginFormTests
//
//  Created by Cesar Paiva on 22/11/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import Foundation
import XCTest
@testable import LoginForm

class MockLoginViewModel: LoginViewModel {
    
    var performInitialViewSetupExpectation: XCTestExpectation?
    var userNameDidOnExitExpectation: XCTestExpectation?
    var passwordDidOnExitExpectation: XCTestExpectation?
    var userNameUpdatedExpectation: (XCTestExpectation, expectedValue: String)?
    var passwordUpdatedExpectation: (XCTestExpectation, expectedValue: String)?
    var loginExpectation: (XCTestExpectation, expectedUserName: String, expectedPassword: String)?
    
    override func performInitialViewSetup() {
        performInitialViewSetupExpectation?.fulfill()
    }
    
    override func userNameDidEndOnExit() {
        userNameDidOnExitExpectation?.fulfill()
    }
    
    override func passwordDidEndOnExit() {
        passwordDidOnExitExpectation?.fulfill()
    }
    
    override func userNameUpdated(_ value: String?) {
        if let (expectation, expectedValue) = userNameUpdatedExpectation, let value = value {
            if value.compare(expectedValue) == .orderedSame {
                expectation.fulfill()
            }
        }
    }
    
    override func passwordUpdated(_ value: String?) {
        if let (expectation, expectedValue) = passwordUpdatedExpectation, let value = value {
            if value.compare(expectedValue) == .orderedSame {
                expectation.fulfill()
            }
        }
    }
    
    override func login(userName: String?, password: String?) {
        if let (expectation, expectedUserName, expectedPassword) = loginExpectation, let userName = userName, let password = password {
            if ((userName.compare(expectedUserName) == .orderedSame) &&
                (password.compare(expectedPassword) == .orderedSame)) {
                expectation.fulfill()
            }
        }
    }
    
}
