//
//  SignupViewController.swift
//  Fundall
//
//  Created by apple on 14/06/2021.
//

import UIKit

class SignupViewController: UIViewController {
    
    @IBOutlet weak var firstName: UITextField!
    @IBOutlet weak var lastName: UITextField!
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var phoneNumber: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var eyeSecureButton: UIButton!
    
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    
    @IBAction func eyeSecureTapped(_ sender: UIButton) {
        passwordField.isSecureTextEntry.toggle()
        let imageName = passwordField.isSecureTextEntry ? "eye" : "eye.slash"
        eyeSecureButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    @IBAction func inviteCode(_ sender: UIButton) {
        
    }
    
    @IBAction func signupPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func termsConditionPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func privacyPolicyPressed(_ sender: UIButton) {
        
    }
}
