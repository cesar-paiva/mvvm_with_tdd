//
//  LoginViewControllerProtocol.swift
//  LoginForm
//
//  Created by Cesar Paiva on 11/11/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import Foundation

protocol LoginViewControllerProtocol: class {
    
    func clearUserNameField()
    func clearPasswordField()
    func enableLoginButton(_ status: Bool)
    func enableCreateAccountButton(_ status: Bool)
    func hideKeyboard()
    
}
