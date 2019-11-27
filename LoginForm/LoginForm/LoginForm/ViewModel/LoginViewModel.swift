//
//  LoginViewModel.swift
//  LoginForm
//
//  Created by Cesar Paiva on 11/11/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import Foundation

class LoginViewModel {
    
    weak var view: LoginViewControllerProtocol?
    var userNameValidator: UserNameValidator?
    var passwordValidator: PasswordValidator?
    var userNameValidated: Bool
    var passwordValidated: Bool
    var loginController: LoginController?
    
    init(view: LoginViewControllerProtocol) {
        self.view = view
        self.userNameValidated = false
        self.passwordValidated = false
    }
    
    func performInitialViewSetup() {
        view?.clearUserNameField()
        view?.clearPasswordField()
        view?.enableLoginButton(false)
        view?.enableCreateAccountButton(true)
    }
    
    func login(userName:String?, password:String?) {
        
        let controller = self.loginController ?? LoginController(delegate: self)
        
        if let userName = userName, let password = password, let model = LoginModel(userName: userName, password: password) {
            controller.doLogin(model: model)
        }
    }
    
    func userNameDidEndOnExit(){
        view?.hideKeyboard()
    }
    
    func passwordDidEndOnExit() {
        view?.hideKeyboard()
    }
    
    func userNameUpdated(_ value:String?) {
        
        guard let value = value else {
            view?.enableLoginButton(false)
            return
        }
        
        let validator = userNameValidator ?? UserNameValidator()
        userNameValidated = validator.validate(value)
        
        if userNameValidated == false {
            view?.enableLoginButton(false)
            return
        }
        
        if passwordValidated == false {
            view?.enableLoginButton(false)
            return
        }
        
        view?.enableLoginButton(true)
        
    }
    
    func passwordUpdated(_ value:String?) {
        
        guard let value = value else {
            view?.enableLoginButton(false)
            return
        }
        
        let validator = passwordValidator ?? PasswordValidator()
        passwordValidated = validator.validate(value)
        
        if userNameValidated == false {
            view?.enableLoginButton(false)
            return
        }
        
        if passwordValidated == false {
            view?.enableLoginButton(false)
            return
        }
        
        view?.enableLoginButton(true)
    }
}

extension LoginViewModel: LoginControllerDelegate {
    
    func loginResult(result: Bool) {
        
    }
    
}

//extension LoginViewModel: SignupControllerDelegate {
//    
//    func doSignup(model: SignupModel) {
//        
//    }
//    
//}
