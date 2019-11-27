//
//  LoginModel.swift
//  LoginForm
//
//  Created by Cesar Paiva on 11/11/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import Foundation

class LoginModel {
    
    var userName:String
    var password:String
    
    init?(userName: String, password: String, userNameValidator: UserNameValidator? = nil, passowrdValidator: PasswordValidator? = nil) {
        
        let validator1 = userNameValidator ?? UserNameValidator()
        
        if !validator1.validate(userName) {
            return nil
        }
        
        let validator2 = passowrdValidator ?? PasswordValidator()
        
        if !validator2.validate(password) {
            return nil
        }
        
        self.userName = userName
        self.password = password
    }
}
