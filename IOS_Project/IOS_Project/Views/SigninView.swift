//
//  SigninView.swift
//  IOS_Project
//
//  Created by Gabriel Roger on 15/02/2019.
//  Copyright © 2019 Gabriel Roger. All rights reserved.
//

import UIKit

class SignInView: UIView {
    
    @IBOutlet weak var mySignInView: UIView!
    
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var emailTextField: UITextField!
    @IBOutlet weak var passwordTextField: UITextField!
    
    var delegate: SignInViewDelegate?
    
    override init(frame: CGRect){
        super.init(frame:frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    
    private func commonInit(){
        Bundle.main.loadNibNamed("SignInView", owner: self, options: nil)
        mySignInView.frame = bounds
        mySignInView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        addSubview(mySignInView)
    }
    
    @IBAction func tapOnLogin(_ sender: Any) {
        delegate?.tapOnLogin()
    }
    
    @IBAction func tapOnRegister(_ sender: Any) {
        delegate?.tapOnRegister()
    }
}

