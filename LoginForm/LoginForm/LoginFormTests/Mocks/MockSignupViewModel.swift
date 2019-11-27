//
//  MockSignupViewModel.swift
//  LoginFormTests
//
//  Created by Cesar Paiva on 22/11/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import Foundation
import XCTest
@testable import LoginForm

class MockSignupViewModel: SignupViewModel {
    
    var performInitialViewSetupExpectation: XCTestExpectation?
    var userNameDidEndOnExitExpectation: XCTestExpectation?
    var emailAddressDidEndOnExitExpectation: XCTestExpectation?
    var passwordDidEndOnExitExpectation: XCTestExpectation?
    var confirmPasswordDidEndOnExitExpectation: XCTestExpectation?
    var userNameUpdatedExpectation: (XCTestExpectation, expectedValue: String)?
    var passwordUpdatedExpectation: (XCTestExpectation, expectedValue: String)?
    var confirmPasswordUpdatedExpectation: (XCTestExpectation, expectedValue: String)?
    var emailAddressUpdatedExpectation: (XCTestExpectation, expectedValue: String)?
    var signupExpectation: (XCTestExpectation, expectedUserName: String, expectedPassword: String, expectedEmailAddress: String)?
    
    override func performInitialViewSetup() {
        performInitialViewSetupExpectation?.fulfill()
    }
    
    override func userNameDidEndOnExit() {
        userNameDidEndOnExitExpectation?.fulfill()
    }
    
    override func emailAddressDidEndOnExit() {
        emailAddressDidEndOnExitExpectation?.fulfill()
    }
    
    override func passwordDidEndOnExit() {
        passwordDidEndOnExitExpectation?.fulfill()
    }
    
    override func confirmPasswordDidEndOnExit() {
        confirmPasswordDidEndOnExitExpectation?.fulfill()
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
    
    override func confirmPasswordUpdated(_ value: String?) {
        if let (expectation, expectedValue) = confirmPasswordUpdatedExpectation, let value = value {
            if value.compare(expectedValue) == .orderedSame {
                expectation.fulfill()
            }
        }
    }
    
    override func emailAddressUpdated(_ value: String?) {
        if let (expectation, expectedValue) = emailAddressUpdatedExpectation, let value = value {
            if value.compare(expectedValue) == .orderedSame {
                expectation.fulfill()
            }
        }
    }
    
    override func signup(userName: String?, password: String?, emailAddress: String?) {
        if let (expectation, expectedUserName, expectedPassword, expectedEmailAddress) = signupExpectation, let userName = userName, let password = password, let emailAddress = emailAddress {
            if ((userName.compare(expectedUserName) == .orderedSame) &&
                (password.compare(expectedPassword) == .orderedSame) &&
                emailAddress.compare(expectedEmailAddress) == .orderedSame) {
                expectation.fulfill()
            }
        }
    }
    
}
