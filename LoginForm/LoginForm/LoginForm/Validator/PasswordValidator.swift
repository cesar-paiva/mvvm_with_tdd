//
//  PasswordValidator.swift
//  LoginForm
//
//  Created by Cesar Paiva on 11/11/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import Foundation

class PasswordValidator {

    func validate(_ value:String) -> Bool {
        if ((value.count < 6) || (value.count > 10)) {
            return false
        }
        
        let whitespace = Set(" ")
        if (value.filter {whitespace.contains($0)}).count > 0 {
            return false
        }

        let uppercaseAlphabets = Set("ABCDEFGHIJKLMNOPQRSTUVWXYZ")
        if (value.filter {uppercaseAlphabets.contains($0)}).count == 0 {
            return false
        }
        
        let lowercaseAlphabets = Set("abcdefghijklmnopqrstuvwxyz")
        if (value.filter {lowercaseAlphabets.contains($0)}).count == 0 {
            return false
        }
        
        let numbers = Set("0123456789")
        if (value.filter {numbers.contains($0)}).count == 0 {
            return false
        }
        
        return true
    }

}
