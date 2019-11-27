//
//  LoginViewController.swift
//  LoginForm
//
//  Created by Cesar Paiva on 10/11/19.
//  Copyright © 2019 Cesar Paiva. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {
    
    @IBOutlet weak var userNameTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var loginButton: UIButton!
    @IBOutlet weak var createAccountButton: UIButton!

    var viewModel: LoginViewModel?

    override func viewDidLoad() {
        super.viewDidLoad()
        
        if viewModel == nil {
            viewModel = LoginViewModel(view: self)
        }
        
        viewModel?.performInitialViewSetup()
    }
    
    @IBAction func login(_ sender: Any) {
        viewModel?.login(userName: userNameTextField.text, password: passwordTextField.text)
    }
    
    
    @IBAction func createAccount(_ sender: Any) {
        self.performSegue(withIdentifier: "presentCreateAccount", sender: self)
    }
    
    @IBAction func userNameDidEndOnExit(_ sender: Any) {
        viewModel?.userNameDidEndOnExit()
    }
    
    @IBAction func passwordDidEndOnExit(_ sender: Any) {
        viewModel?.passwordDidEndOnExit()
    }

}

extension LoginViewController: UITextFieldDelegate {
    
    func textField(_ textField: UITextField, shouldChangeCharactersIn range: NSRange, replacementString string: String) -> Bool {
        
        if textField == userNameTextField {
            viewModel?.userNameUpdated(textField.text)
        }
        
        if textField == passwordTextField {
            viewModel?.passwordUpdated(textField.text)
        }
        
        return true
    }
    
}

extension LoginViewController: LoginViewControllerProtocol {
    
    func clearUserNameField() {
        self.userNameTextField.text = ""
    }
    
    func clearPasswordField() {
        self.passwordTextField.text = ""
    }
    
    func enableLoginButton(_ status: Bool) {
        loginButton.isEnabled = status
    }
    
    func enableCreateAccountButton(_ status: Bool) {
        createAccountButton.isEnabled = status
    }
    
    func hideKeyboard() {
        userNameTextField.resignFirstResponder()
        passwordTextField.resignFirstResponder()
    }
    
    
}
