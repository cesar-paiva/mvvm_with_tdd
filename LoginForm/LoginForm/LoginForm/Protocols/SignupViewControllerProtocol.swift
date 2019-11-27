//
//  SignupViewControllerProtocol.swift
//  LoginForm
//
//  Created by Cesar Paiva on 17/11/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import Foundation

protocol SignupViewControllerProtocol: class {
    
    func clearUserNameField()
    func clearPasswordField()
    func clearConfirmPasswordField()
    func enableCreateButton(_ status: Bool)
    func enableCancelButton(_ status: Bool)
    func hideKeyboard()
    func signup(model: SignupModel)
    func signupResult(result: Bool)
}
