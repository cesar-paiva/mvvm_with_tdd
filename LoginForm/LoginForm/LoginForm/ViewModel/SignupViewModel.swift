//
//  SignupViewModel.swift
//  LoginForm
//
//  Created by Cesar Paiva on 17/11/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import Foundation

class SignupViewModel {
    
    var view: SignupViewControllerProtocol?
    var signupController: SignupController?
    
    var userNameValidator:UserNameValidator?
    var passwordValidator:PasswordValidator?
    var emailAddressValidator:EmailAddressValidator?
    
    var userNameValidated:Bool
    var password1Validated: Bool
    var password2Validated: Bool
    var passwordsAreIdentical: Bool
    var emailAddressValidated: Bool
    
    var password1:String?
    var password2:String?
    
    init(view: SignupViewControllerProtocol) {
        self.view = view
        self.userNameValidated = false
        self.password1Validated = false
        self.password2Validated = false
        self.passwordsAreIdentical = false
        self.emailAddressValidated = false
    }
    
    func performInitialViewSetup() {
        view?.clearUserNameField()
        view?.clearPasswordField()
        view?.clearConfirmPasswordField()
        view?.enableCreateButton(false)
        view?.enableCancelButton(true)
    }
    
    func userNameDidEndOnExit() {
        view?.hideKeyboard()
    }
    
    func passwordDidEndOnExit() {
        view?.hideKeyboard()
    }
    
    func emailAddressDidEndOnExit() {
        view?.hideKeyboard()
    }
    
    func confirmPasswordDidEndOnExit() {
        view?.hideKeyboard()
    }
    
    func userNameUpdated(_ value: String?) {
        
        guard let value = value else {
            view?.enableCreateButton(false)
            return
        }
        let validator = self.userNameValidator ?? UserNameValidator()
        userNameValidated = validator.validate(value)
        
        if userNameValidated == false {
            view?.enableCreateButton(false)
            return
        }
        if password1Validated == true &&
            password2Validated == true &&
            passwordsAreIdentical == true {
            view?.enableCreateButton(true)
            return }
        view?.enableCreateButton(false)
        
    }
    
    func emailAddressUpdated(_ value:String?) {
        
        guard let value = value else {
            view?.enableCreateButton(false)
            return
        }
        
        let validator = self.emailAddressValidator ?? EmailAddressValidator()
        emailAddressValidated = validator.validate(value)
        
        if emailAddressValidated == false {
            view?.enableCreateButton(false)
            return
        }
        
        if password1Validated == true && password2Validated == true && passwordsAreIdentical == true && userNameValidated == true && emailAddressValidated == true {
            view?.enableCreateButton(true)
            return
        }
        
        view?.enableCreateButton(false)
    }
    
    func passwordUpdated(_ value:String?) {
        
        self.password1 = value
        
        guard let password1 = self.password1 else {
            view?.enableCreateButton(false)
            return
        }
        
        if let password2 = password2 {
            passwordsAreIdentical = password1.compare(password2) == .orderedSame
        } else {
            passwordsAreIdentical = false
        }
        
        let validator = self.passwordValidator ?? PasswordValidator()
        password1Validated = validator.validate(password1)
        
        if userNameValidated == false {
            view?.enableCreateButton(false)
            return
        }
        
        if password1Validated == true && password2Validated == true && passwordsAreIdentical == true {
            view?.enableCreateButton(true)
            return
        }
        
        view?.enableCreateButton(false)
    }
    
    func confirmPasswordUpdated(_ value:String?) {
        
        self.password2 = value
        
        guard let password2 = self.password2 else {
            view?.enableCreateButton(false)
            return
        }
        
        if let password1 = password1 {
            passwordsAreIdentical = password1.compare(password2) == .orderedSame
        } else {
            passwordsAreIdentical = false
        }
        
        let validator = self.passwordValidator ?? PasswordValidator()
        password2Validated = validator.validate(password2)
        
        if userNameValidated == false {
            view?.enableCreateButton(false)
            return
        }
        
        if password1Validated == true && password2Validated == true && passwordsAreIdentical == true {
            view?.enableCreateButton(true)
            return
        }
        
        view?.enableCreateButton(false)
    }
    
    func signup(userName:String?, password:String?, emailAddress:String?) {
        
        let controller = self.signupController ?? SignupController(delegate:self)
        
        if let userName = userName, let password = password, let emailAddress = emailAddress,
            let model = SignupModel(userName: userName, password: password, emailAddress:emailAddress) {
            controller.doSignup(model: model)
        }
    }
}

extension SignupViewModel: SignupControllerDelegate {
    
    func doSignup(model: SignupModel) {
        view?.signup(model: model)
    }
    
    func signupResult(result: Bool) {
        view?.signupResult(result: result)
    }
    
}
