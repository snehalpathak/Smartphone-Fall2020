//
//  ResetPasswordViewController.swift
//  LoginApp
//
//  Created by user923902 on 11/17/20.
//

import UIKit
import Firebase
import SwiftSpinner

class ResetPasswordViewController: UIViewController {

    @IBOutlet weak var txtEmail: UITextField!
    
    @IBOutlet weak var lblStatus: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func performResetPassword(_ sender: Any) {
        
        let email = txtEmail.text
        
        if email == "" {
            lblStatus.text = "Please enter an email"
            return
        }
        if email?.isEmail == false {
            lblStatus.text = "Please enter a valid email"
            return
        }
        
        SwiftSpinner.show("Sending Reset Link...")
        
    
        Auth.auth().sendPasswordReset(withEmail: email!) { error in
                SwiftSpinner.hide()
                
                let strongSelf = self
                
                if error != nil {
                    strongSelf.lblStatus.text = error?.localizedDescription
                    return
                }
                
            strongSelf.lblStatus.text = "Sent"
            self.navigationController?.popViewController(animated: true)
        }
    }
}
