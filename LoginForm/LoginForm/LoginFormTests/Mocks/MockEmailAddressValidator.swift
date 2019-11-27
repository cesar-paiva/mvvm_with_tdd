//
//  MockEmailAddressValidator.swift
//  LoginFormTests
//
//  Created by Cesar Paiva on 18/11/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import Foundation
import XCTest
@testable import LoginForm

class MockEmailAddressValidator: EmailAddressValidator {
    
    var expectation: XCTestExpectation?
    var expectedValue: String?
 
    init(_ expectation: XCTestExpectation, expectedValue: String) {
        self.expectation = expectation
        self.expectedValue = expectedValue
        super.init()
    }
    
    override func validate(_ value:String) -> Bool {
        
        if let expectation = self.expectation, let expectedValue = self.expectedValue {
            if value.compare(expectedValue) == .orderedSame {
                expectation.fulfill()
            }
        }
        
        return super.validate(value)
    }
    
}
