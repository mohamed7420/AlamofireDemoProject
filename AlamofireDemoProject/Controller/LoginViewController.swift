//
//  ViewController.swift
//  AlamofireDemoProject
//
//  Created by Mohamed on 11/7/20.
//  Copyright © 2020 Mohamed. All rights reserved.
//

import UIKit

class LoginViewController: UIViewController {

    @IBOutlet weak var textFieldEmail: UITextField!
    @IBOutlet weak var textFieldPassword: UITextField!
    
    let serviceManager: ServiceMangerDelegate = ServiceManager()
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        
    }

    @IBAction func loginButtonAction(_ sender: UIButton) {
        
        guard let email = textFieldEmail.text else {return}
        guard let password = textFieldPassword.text else {return}
        
        serviceManager.login(email: email, password: password) {
            
        }
    }
    
    @IBAction func registerButton(_ sender: UIButton) {
        
        let storyboard = UIStoryboard.init(name: "Main", bundle: nil)
        let vc = storyboard.instantiateViewController(withIdentifier: "RegisterViewController")
        
        vc.modalPresentationStyle = .fullScreen
        
        self.present(vc, animated: true, completion: nil)
    }
    
    
}

