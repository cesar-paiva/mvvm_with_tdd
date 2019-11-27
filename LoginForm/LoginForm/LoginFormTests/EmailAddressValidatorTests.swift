//
//  EmailAddressValidatorTests.swift
//  LoginFormTests
//
//  Created by Cesar Paiva on 11/11/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import XCTest

@testable import LoginForm

class EmailAddressValidatorTests: XCTestCase {
    
    fileprivate var validator: EmailAddressValidator!
    
    fileprivate let emptyString = ""
    
    fileprivate let validEmailAddress1 = "a@tddcourse.com"
    fileprivate let validEmailAddress2 = "a@tddcourse.com"
    fileprivate let validEmailAddress3 = "b@tddcourse.com"
    fileprivate let validEmailAddress4 = "cesar.paiva@tddcourse.com"
    
    fileprivate let invalidEmailAddress1 = "ab.com"
    fileprivate let invalidEmailAddress2 = "abcom"
    fileprivate let invalidEmailAddress3 = "a@tdd_course@com"
    fileprivate let invalidEmailAddress4 = "a @tdd_course@com"
    fileprivate let invalidEmailAddress5 = "1234@tdd_course@com"
    fileprivate let invalidEmailAddress6 = "abc+@tdd_course@com"

    override func setUp() {
        super.setUp()
        validator = EmailAddressValidator()
    }
    
    override func tearDown() {
        super.tearDown()
        validator = nil
    }
}

// MARK: Empty string validation
extension EmailAddressValidatorTests {
    
    func testValidate_EmptyString_ReturnsFalse() {
        XCTAssertFalse(validator.validate(emptyString), "string can not be empty.")
    }
    
}

// MARK: invalid email-addresses
extension EmailAddressValidatorTests {
    
    func testValidate_InvalidEmailAddress1_ReturnsFalse() {
        XCTAssertFalse(validator.validate(invalidEmailAddress1), "/(invalidEmailAddress1) is not a valid e-mail address.")
    }
    
    func testValidate_InvalidEmailAddress2_ReturnsFalse() {
        XCTAssertFalse(validator.validate(invalidEmailAddress2), "/(invalidEmailAddress2) is not a valid e-mail address.")
    }
    
    func testValidate_InvalidEmailAddress3_ReturnsFalse() {
        XCTAssertFalse(validator.validate(invalidEmailAddress3), "/(invalidEmailAddress3) is not a valid e-mail address.")
    }
    
    func testValidate_InvalidEmailAddress4_ReturnsFalse() {
        XCTAssertFalse(validator.validate(invalidEmailAddress4))
    }
    
    func testValidate_InvalidEmailAddress5_ReturnsFalse() {
        XCTAssertFalse(validator.validate(invalidEmailAddress5))
    }
    
    func testValidate_InvalidEmailAddress6_ReturnsFalse() {
        XCTAssertFalse(validator.validate(invalidEmailAddress6))
    }
    
}


// MARK: valid email-addresses
extension EmailAddressValidatorTests {
    
    func testValidate_ValidEmailAddress1_ReturnsTrue() {
        XCTAssertTrue(validator.validate(validEmailAddress1), "/(validEmailAddress1) is a valid e-mail address.")
    }
    
    func testValidate_ValidEmailAddress2_ReturnsTrue() {
        XCTAssertTrue(validator.validate(validEmailAddress2), "/(validEmailAddress2) is a valid e-mail address.")
    }
    
    func testValidate_ValidEmailAddress3_ReturnsTrue() {
        XCTAssertTrue(validator.validate(validEmailAddress3), "/(validEmailAddress3) is a valid e-mail address.")
    }
    
    func testValidate_ValidEmailAddress4_ReturnsTrue() {
        XCTAssertTrue(validator.validate(validEmailAddress4), "/(validEmailAddress4) is a valid e-mail address.")
    }
    
}
