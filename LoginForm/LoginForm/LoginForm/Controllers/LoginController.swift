//
//  LoginController.swift
//  LoginForm
//
//  Created by Cesar Paiva on 16/11/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import Foundation

protocol LoginControllerDelegate {
    func loginResult(result: Bool)
}

class LoginController {
    
    let dummyUserName = "Alibaba"
    let dummyPassword = "D%io7AFn9Y"
    
    var loginControllerDelegate: LoginControllerDelegate?
    
    init(delegate: LoginControllerDelegate?) {
        self.loginControllerDelegate = delegate
    }
    
    func doLogin(model: LoginModel) {
        
        let userName = model.userName
        let password = model.password
        
        if ((userName.compare(dummyUserName) == .orderedSame) && (password.compare(dummyPassword) == .orderedSame)) {
            loginControllerDelegate?.loginResult(result: true)
            return
        }
        
        loginControllerDelegate?.loginResult(result: false)
    }
    
    
}
