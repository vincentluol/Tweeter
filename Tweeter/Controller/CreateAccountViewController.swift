//
//  CreateAccountViewController.swift
//  Tweeter
//
//  Created by Vincent Luo on 8/20/19.
//  Copyright © 2019 Vincent Luo. All rights reserved.
//

import UIKit
import Firebase
import SVProgressHUD

class CreateAccountViewController: UIViewController {
    
    @IBOutlet weak var nameTextField: UITextField!
    
    @IBOutlet weak var emailTextField: UITextField!
    
    @IBOutlet weak var passwordTextField: UITextField!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        nameTextField.becomeFirstResponder()
    }
    
    @IBAction func createPressed(_ sender: Any) {
        SVProgressHUD.show()
        Auth.auth().createUser(withEmail: emailTextField.text!, password: passwordTextField.text!) { (user, error) in
            if error != nil {
                print(error!)
            } else {
                print("User created")
                SVProgressHUD.dismiss()
                self.performSegue(withIdentifier: "goToHome", sender: self)
            }
            
        }
    }
    
}

