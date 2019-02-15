//
//  SignUpView.swift
//  IOS_Project
//
//  Created by Gabriel Roger on 15/02/2019.
//  Copyright © 2019 Gabriel Roger. All rights reserved.
//

import UIKit

class SignUpView: UIView {
    
    @IBOutlet weak var mySignUpView: UIView!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    @IBOutlet weak var passwordConfirmationTextField: UITextField!
    
    var delegate: SignUpViewDelegate?
    
    override init(frame: CGRect){
        super.init(frame:frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit(){
        Bundle.main.loadNibNamed("SignUpView", owner: self, options: nil)
        mySignUpView.frame = bounds
        mySignUpView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        addSubview(mySignUpView)
    }
    
    @IBAction func tapOnSignUp(_ sender: Any) {
        delegate?.tapOnSignUp()
    }
    @IBAction func tapOnGoLogin(_ sender: Any) {
        delegate?.tapOnGoToLogin()
    }
}
