//
//  SignupController.swift
//  LoginForm
//
//  Created by Cesar Paiva on 18/11/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import Foundation

protocol SignupControllerDelegate: class {
    func signupResult(result:Bool)
}

class SignupController {
    
    let dummyUsername = "Alibaba"
    let dummyPassword = "D%io7AFn9Y"
    let dummyEmailAddress = "a@b.com"
    
    weak var signupControllerDelegate: SignupControllerDelegate?
        
    init(delegate: SignupControllerDelegate?) {
        self.signupControllerDelegate = delegate
    }

    func doSignup(model:SignupModel) {
        
        let userName = model.userName
        let password = model.password
        let emailAddress = model.emailAddress
        
        if ((userName.compare(dummyUsername) == .orderedSame) &&
            (password.compare(dummyPassword) == .orderedSame) &&
            (emailAddress.compare(dummyEmailAddress) == .orderedSame)) {
            signupControllerDelegate?.signupResult(result: true)
            return
        }
        
        signupControllerDelegate?.signupResult(result: false)
    }
}
