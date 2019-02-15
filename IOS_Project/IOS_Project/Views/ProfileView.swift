//
//  ProfileView.swift
//  IOS_Project
//
//  Created by Gabriel Roger on 15/02/2019.
//  Copyright © 2019 Gabriel Roger. All rights reserved.
//

import UIKit

class ProfilView: UIView {
    
    @IBOutlet weak var myProfilView: UIView!
    
    @IBOutlet weak var emailField: UILabel!
    @IBOutlet weak var errorLabel: UILabel!
    
    @IBOutlet weak var newPasswordTextField: UITextField!
    @IBOutlet weak var confirmNewPasswordTextField: UITextField!
    
    var delegate: ProfilViewDelegate?
    
    override init(frame: CGRect) {
        super.init(frame:frame)
        commonInit()
    }
    
    required init?(coder aDecoder: NSCoder) {
        super.init(coder: aDecoder)
        commonInit()
    }
    private func commonInit() {
        Bundle.main.loadNibNamed("ProfilView", owner: self, options: nil)
        myProfilView.frame = bounds
        myProfilView.autoresizingMask = [.flexibleHeight, .flexibleWidth]
        addSubview(myProfilView)
    }
    
    @IBAction func tapOnChangePassword(_ sender: Any) {
        delegate?.tapOnChangePassword()
    }
    
    @IBAction func tapOnLogout(_ sender: Any) {
        delegate?.tapOnLogout()
    }
}
