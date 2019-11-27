//
//  MockLoginController.swift
//  LoginFormTests
//
//  Created by Cesar Paiva on 16/11/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import Foundation
import XCTest
@testable import LoginForm

class MockLoginController: LoginController {
    
    private var expectation: XCTestExpectation?
    private var expectedUserName: String?
    private var expectedPassword: String?
    
    var shouldReturnTrueOnLogin: Bool
    
    init(_ expectation: XCTestExpectation, expectedUserName: String, expectedPassword: String) {
        self.expectation = expectation
        self.expectedUserName = expectedUserName
        self.expectedPassword = expectedPassword
        self.shouldReturnTrueOnLogin = false
        
        super.init(delegate: nil)
    }
    
    override func doLogin(model: LoginModel) {
        
        if let expectation = self.expectation, let expectedUserName = self.expectedUserName, let expectedPassword = expectedPassword {
            
            if((model.userName.compare(expectedUserName) == .orderedSame) && (model.password.compare(expectedPassword) == .orderedSame)) {
                expectation.fulfill()
            }
            
        }
        
        loginControllerDelegate?.loginResult(result: shouldReturnTrueOnLogin)
    }
    
    
    
    
}
