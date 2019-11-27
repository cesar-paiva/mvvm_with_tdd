//
//  PasswordValidatorTests.swift
//  LoginFormTests
//
//  Created by Cesar Paiva on 26/11/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import XCTest

@testable import LoginForm

class PasswordValidatorTests: XCTestCase {
    
    fileprivate var sut: PasswordValidator!
    
    fileprivate let emptyString = ""
    
    fileprivate let validPassword1 = "abcABC123"
    fileprivate let validPassword2 = "123ABCabc"
    fileprivate let validPassword3 = "ABCabc123"
    fileprivate let validPassword4 = "ABC123abc"
    
    fileprivate let invalidPassword1 = "abc"
    fileprivate let invalidPassword2 = "ab cd ef"
    fileprivate let invalidPassword3 = "ccccccc"
    fileprivate let invalidPassword4 = "12345AAA"
    fileprivate let invalidPassword5 = "abcdABCD"

    override func setUp() {
        super.setUp()
        sut = PasswordValidator()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
}

// MARK: Empty string validation
extension PasswordValidatorTests {
    
    func testValidate_EmptyString_ReturnsFalse() {
        XCTAssertFalse(sut.validate(emptyString), "string can not be empty.")
    }
    
}

// MARK: invalid email-addresses
extension PasswordValidatorTests {

    func testValidate_InvalidPassword1_ReturnsFalse() {
        XCTAssertFalse(sut.validate(invalidPassword1), "/(invalidPassword1) is not a valid password.")
    }

    func testValidate_InvalidPassword2_ReturnsFalse() {
        XCTAssertFalse(sut.validate(invalidPassword2), "/(invalidPassword2) is not a valid password.")
    }

    func testValidate_InvalidPassword3_ReturnsFalse() {
        XCTAssertFalse(sut.validate(invalidPassword3), "/(invalidPassword3) is not a valid password.")
    }

    func testValidate_InvalidPassword4_ReturnsFalse() {
        XCTAssertFalse(sut.validate(invalidPassword4))
    }

    func testValidate_InvalidPassword5_ReturnsFalse() {
        XCTAssertFalse(sut.validate(invalidPassword5))
    }

}


// MARK: valid password
extension PasswordValidatorTests {

    func testValidate_ValidPassword1_ReturnsTrue() {
        XCTAssertTrue(sut.validate(validPassword1), "/(validPassword1) is a valid password.")
    }

    func testValidate_ValidPassword2_ReturnsTrue() {
        XCTAssertTrue(sut.validate(validPassword2), "/(validPassword2) is a valid password.")
    }

    func testValidate_ValidPassword3_ReturnsTrue() {
        XCTAssertTrue(sut.validate(validPassword3), "/(validPassword3) is a valid password.")
    }

    func testValidate_ValidPassword4_ReturnsTrue() {
        XCTAssertTrue(sut.validate(validPassword4), "/(validPassword4) is a valid password.")
    }

}
//
