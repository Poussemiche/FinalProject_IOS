//
//  LoginViewController.swift
//  IOS_Project
//
//  Created by Gabriel Roger on 15/02/2019.
//  Copyright © 2019 Gabriel Roger. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController, SignInViewDelegate, SignUpViewDelegate, ProfilViewDelegate {
    
    @IBOutlet weak var myProfilView: ProfilView!
    @IBOutlet weak var mySignIView: SignInView!
    @IBOutlet weak var mySignUpView: SignUpView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        mySignUpView.delegate = self
        mySignIView.delegate = self
        myProfilView.delegate = self
    }
    
    func tapOnGoToLogin() {
        mySignIView.isHidden = false
        mySignUpView.isHidden = true
        mySignUpView.errorLabel.text = ""
        mySignUpView.emailTextField.text = ""
        mySignUpView.passwordTextField.text = ""
        mySignUpView.passwordConfirmationTextField.text = ""
    }
    
    func tapOnRegister() {
        mySignIView.isHidden = true
        mySignIView.errorLabel.text = ""
        mySignIView.emailTextField.text = ""
        mySignIView.passwordTextField.text = ""
        mySignUpView.isHidden = false
    }
    
    func tapOnSignUp() {
        if (!mySignUpView.emailTextField.text!.contains("@") || mySignUpView.emailTextField.text!.count < 6) {
            mySignUpView.errorLabel.text = "Email must contains an '@' and at least 6 characters"
        } else if(mySignUpView.passwordTextField.text!.count < 6) {
            mySignUpView.errorLabel.text = "Password must contains at least 6 characters"
        } else if(RegisteredUser.user != nil) {
            mySignUpView.errorLabel.text = "Error: sign up"
        } else {
            mySignIView.errorLabel.text = "Successful sign up"
            RegisteredUser.createUser(user: User.init(email: mySignUpView.emailTextField.text!, password: mySignUpView.passwordTextField.text!))
            tapOnGoToLogin()
        }
    }
    
    
    func tapOnLogin() {
        if(RegisteredUser.user != nil) {
            if(RegisteredUser.user?.email == mySignIView.emailTextField.text && RegisteredUser.user?.password == mySignIView.passwordTextField.text) {
                myProfilView.errorLabel.text = "Successful login"
                myProfilView.emailField.text = mySignIView.emailTextField.text
                mySignIView.emailTextField.text = ""
                mySignIView.passwordTextField.text = ""
                mySignIView.isHidden = true
                mySignIView.errorLabel.text = ""
                myProfilView.isHidden = false
            } else {
                mySignIView.errorLabel.text = "Unable to find a match with this pair of email / password"
            }
        } else {
            mySignIView.errorLabel.text = "Please register first"
        }
    }
    
    func tapOnChangePassword() {
        if(myProfilView.newPasswordTextField.text == RegisteredUser.user?.password) {
            myProfilView.errorLabel.text = "Same password, please enter a new one"
        } else if(myProfilView.newPasswordTextField.text == "") {
            myProfilView.errorLabel.text = "Your password can't be empty"
        } else if(myProfilView.newPasswordTextField.text!.count < 6) {
            myProfilView.errorLabel.text = "Password need at least 6 characters"
        } else if(myProfilView.newPasswordTextField.text == myProfilView.confirmNewPasswordTextField.text) {
            myProfilView.confirmNewPasswordTextField.text = ""
            myProfilView.newPasswordTextField.text = ""
            myProfilView.errorLabel.text = "Password successfully changed"
        } else {
            myProfilView.errorLabel.text = "Passwords are not the same"
        }
    }
    
    func tapOnLogout() {
        myProfilView.isHidden = true
        myProfilView.errorLabel.text = ""
        myProfilView.newPasswordTextField.text = ""
        myProfilView.confirmNewPasswordTextField.text = ""
        mySignIView.isHidden = false
    }
}

