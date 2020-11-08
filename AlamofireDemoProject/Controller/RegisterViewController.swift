//
//  RegisterViewController.swift
//  AlamofireDemoProject
//
//  Created by Mohamed on 11/7/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit

class RegisterViewController: UIViewController {

    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    @IBOutlet weak var textFieldConfirm: UITextField!
    
    let serviceManager: ServiceMangerDelegate = ServiceManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()

    }
    
    @IBAction func buttonRegister(_ sender: UIButton) {
        
        guard let email = textFieldEmail.text else {return}
        guard let password = textFieldPassword.text else {return}
        guard let confirm = textFieldConfirm.text else {return}
        
        serviceManager.register(email: email, password: password, passwordConfirmation: confirm) {
            
        }
    }
}
