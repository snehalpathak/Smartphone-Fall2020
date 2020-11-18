//
//  SignUpViewController.swift
//  LoginApp
//
//  Created by user923902 on 11/17/20.
//

import UIKit
import Firebase
import SwiftSpinner

class SignUpViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
        
    @IBOutlet weak var txtPassword: UITextField!
    
    @IBOutlet weak var lblStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    
    @IBAction func performSignUp(_ sender: Any) {
        let email = txtEmail.text
        let password = txtPassword.text
        
        if email == "" || password!.count < 6 {
            lblStatus.text = "Please enter email and correct password"
            return
        }
        if email?.isEmail == false {
            lblStatus.text = "Please enter valid e mail"
            return
        }
        
        SwiftSpinner.show("Signing in...")
        Auth.auth().createUser(withEmail: email!, password: password!) { authResult, error in
            SwiftSpinner.hide()
            let strongSelf = self
            
            if error != nil {
                strongSelf.lblStatus.text = error?.localizedDescription
                return
            }
            
            self.txtPassword.text = ""

            strongSelf.navigationController?.popViewController(animated: true)
        }
    }
    
}
