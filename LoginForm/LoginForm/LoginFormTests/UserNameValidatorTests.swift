//
//  UserNameValidatorTests.swift
//  LoginFormTests
//
//  Created by Cesar Paiva on 25/11/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import XCTest
@testable import LoginForm

class UserNameValidatorTests: XCTestCase {
    
    fileprivate var sut: UserNameValidator!
    
    fileprivate let emptyString = ""
    
    fileprivate let singleCharacterName = "a"
    fileprivate let twoCharacterName = "ab"
    fileprivate let tenCharacterName = "abcdefghij"
    fileprivate let elevenCharacterName = "abcdefghijk"
    
    fileprivate let nameWithWhitespace = "abc def"
    fileprivate let nameWithUnderscore = "abc_def"
    
    fileprivate let nameWithDigit0 = "abc00"
    fileprivate let nameWithDigit1 = "abc11"
    fileprivate let nameWithDigit2 = "abc22"
    fileprivate let nameWithDigit3 = "abc33"
    fileprivate let nameWithDigit4 = "abc44"
    fileprivate let nameWithDigit5 = "abc55"
    fileprivate let nameWithDigit6 = "abc66"
    fileprivate let nameWithDigit7 = "abc77"
    fileprivate let nameWithDigit8 = "abc88"
    fileprivate let nameWithDigit9 = "abc99"
    fileprivate let nameWithEmoji = "👻👻👻"

    fileprivate let nameWithUnsupportedSpecialCharacters1 = "+-.,!@#$%"
    fileprivate let nameWithUnsupportedSpecialCharacters2 = "^&*();\\/|"
    fileprivate let nameWithUnsupportedSpecialCharacters3 = "<>\""

    fileprivate let nameWithAlphabets1 = "ABCDEFGH"
    fileprivate let nameWithAlphabets2 = "IJKLMNOP"
    fileprivate let nameWithAlphabets3 = "QRSTUVWX"
    fileprivate let nameWithAlphabets4 = "YYYYZZZZ"
    fileprivate let nameWithAlphabets5 = "abcdefgh"
    fileprivate let nameWithAlphabets6 = "ijklmnop"
    fileprivate let nameWithAlphabets7 = "qrstuvwx"
    fileprivate let nameWithAlphabets8 = "yyyyzzzz"
    
    override func setUp() {
        super.setUp()
        sut = UserNameValidator()
    }
    
    override func tearDown() {
        super.tearDown()
        sut = nil
    }
    
}



// MARK: Empty string validation
extension UserNameValidatorTests {
    
    func testValidate_EmptyString_ReturnsFalse() {
        XCTAssertFalse(sut.validate(emptyString), "string can not be empty.")
    }
    
}

// MARK: whitespace validation
extension UserNameValidatorTests {
    
    func testValidate_StringWithWhitespace_ReturnsFalse() {
        XCTAssertFalse(sut.validate(nameWithWhitespace), "string can not be have whitespace.")
    }
    
}

// MARK: underscore validation
extension UserNameValidatorTests {
    
    func testValidate_StringWithUnderscore_ReturnsTrue() {
        XCTAssertTrue(sut.validate(nameWithUnderscore), "/(nameWithUnderscore) should have been valid.")
    }
    
}

// MARK: String length validation
extension UserNameValidatorTests {
    
    func testValidate_InputLessThanTwoCharachtersInLength_ReturnsFalse() {
        XCTAssertFalse(sut.validate(singleCharacterName), "/(twoCharacterName) should not have been valid.")
    }
    
    func testValidate_InputGreaterThanTwentyCharachtersInLength_ReturnsFalse() {
        XCTAssertFalse(sut.validate(elevenCharacterName), "/(twoCharacterName) should not have been valid.")
    }
    
    func testValidate_InputTwoCharachtersInLength_ReturnsTrue() {
        XCTAssertTrue(sut.validate(twoCharacterName), "/(twoCharacterName) should have been valid.")
    }
    
    func testValidate_InputTwentyCharachtersInLength_ReturnsTrue() {
        XCTAssertTrue(sut.validate(tenCharacterName), "/(tenCharacterName) should have been valid.")
    }
}

// MARK: special character validation
extension UserNameValidatorTests {
    
    func testValidate_StringWithSpecialCharacters1_ReturnsFalse() {
        XCTAssertFalse(sut.validate(nameWithUnsupportedSpecialCharacters1), "/(nameWithUnsupportedSpecialCharacters1) should not have been valid.")
    }

    func testValidate_StringWithSpecialCharacters2_ReturnsFalse() {
        XCTAssertFalse(sut.validate(nameWithUnsupportedSpecialCharacters2), "/(nameWithUnsupportedSpecialCharacters2) should not have been valid.")
    }
    
    func testValidate_StringWithSpecialCharacters3_ReturnsFalse() {
        XCTAssertFalse(sut.validate(nameWithUnsupportedSpecialCharacters3), "/(nameWithUnsupportedSpecialCharacters3) should not have been valid.")
    }
}


// MARK: alphanumeric validation
extension UserNameValidatorTests {
    
    func testValidate_StringWithAlphanumericCharacters1_ReturnsTrue() {
        XCTAssertTrue(sut.validate(nameWithAlphabets1), "/(nameWithAlphabets1) should have been valid.")
    }
    
    func testValidate_StringWithAlphanumericCharacters2_ReturnsTrue() {
        XCTAssertTrue(sut.validate(nameWithAlphabets2), "/(nameWithAlphabets2) should have been valid.")
    }
    
    func testValidate_StringWithAlphanumericCharacters3_ReturnsTrue() {
        XCTAssertTrue(sut.validate(nameWithAlphabets3), "/(nameWithAlphabets3) should have been valid.")
    }
    
    func testValidate_StringWithAlphanumericCharacters4_ReturnsTrue() {
        XCTAssertTrue(sut.validate(nameWithAlphabets4), "/(nameWithAlphabets4) should have been valid.")
    }
    
    func testValidate_StringWithAlphanumericCharacters5_ReturnsTrue() {
        let validator = UserNameValidator()
        XCTAssertTrue(sut.validate(nameWithAlphabets5), "/(nameWithAlphabets5) should have been valid.")
    }
    
    func testValidate_StringWithAlphanumericCharacters6_ReturnsTrue() {
        let validator = UserNameValidator()
        XCTAssertTrue(sut.validate(nameWithAlphabets6), "/(nameWithAlphabets6) should have been valid.")
    }
    
    func testValidate_StringWithAlphanumericCharacters7_ReturnsTrue() {
        let validator = UserNameValidator()
        XCTAssertTrue(sut.validate(nameWithAlphabets7), "/(nameWithAlphabets7) should have been valid.")
    }
    
    func testValidate_StringWithAlphanumericCharacters8_ReturnsTrue() {
        let validator = UserNameValidator()
        XCTAssertTrue(sut.validate(nameWithAlphabets8), "/(nameWithAlphabets8) should have been valid.")
    }
}


// MARK: Numeric validation
extension UserNameValidatorTests {
    
    func testValidate_StringWithDigit0_ReturnsTrue() {
        let validator = UserNameValidator()
        XCTAssertTrue(sut.validate(nameWithDigit0), "/(nameWithDigit0) should have been valid.")
    }
    
    func testValidate_StringWithDigit1_ReturnsTrue() {
        let validator = UserNameValidator()
        XCTAssertTrue(sut.validate(nameWithDigit1), "/(nameWithDigit1) should have been valid.")
    }
    
    func testValidate_StringWithDigit2_ReturnsTrue() {
        let validator = UserNameValidator()
        XCTAssertTrue(sut.validate(nameWithDigit2), "/(nameWithDigit2) should have been valid.")
    }
    
    func testValidate_StringWithDigit3_ReturnsTrue() {
        let validator = UserNameValidator()
        XCTAssertTrue(sut.validate(nameWithDigit3), "/(nameWithDigit3) should have been valid.")
    }
    
    func testValidate_StringWithDigit4_ReturnsTrue() {
        let validator = UserNameValidator()
        XCTAssertTrue(sut.validate(nameWithDigit4), "/(nameWithDigit4) should have been valid.")
    }
    
    func testValidate_StringWithDigit5_ReturnsTrue() {
        let validator = UserNameValidator()
        XCTAssertTrue(sut.validate(nameWithDigit5), "/(nameWithDigit5) should have been valid.")
    }
    
    func testValidate_StringWithDigit6_ReturnsTrue() {
        let validator = UserNameValidator()
        XCTAssertTrue(sut.validate(nameWithDigit6), "/(nameWithDigit6) should have been valid.")
    }
    
    func testValidate_StringWithDigit7_ReturnsTrue() {
        let validator = UserNameValidator()
        XCTAssertTrue(sut.validate(nameWithDigit7), "/(nameWithDigit7) should have been valid.")
    }
    
    func testValidate_StringWithDigit8_ReturnsTrue() {
        let validator = UserNameValidator()
        XCTAssertTrue(sut.validate(nameWithDigit8), "/(nameWithDigit8) should have been valid.")
    }
    
    func testValidate_StringWithDigit9_ReturnsTrue() {
        let validator = UserNameValidator()
        XCTAssertTrue(sut.validate(nameWithDigit9), "/(nameWithDigit9) should have been valid.")
    }
    
    func testValidate_StringWithEmoji_ReturnsFalse() {
        let validator = UserNameValidator()
        XCTAssertFalse(sut.validate(nameWithEmoji), "/(nameWithEmoji) should have been invalid")
    }
    
}
