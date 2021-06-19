//
//  SignupViewController.swift
//  Fundall
//
//  Created by apple on 14/06/2021.
//

import UIKit

class SignupViewController: UIViewController {
    
    var email: String = ""
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
        let goHome = UIStoryboard(name: "Homepage", bundle: nil)
        let homeVC = goHome.instantiateViewController(identifier: "Home") as! HomepageViewController
        navigationController?.pushViewController(homeVC, animated: true)
       
    }
    
    
    @IBAction func loginPressed(_ sender: UIButton) {
        let logon = UIStoryboard(name: "Login", bundle: nil)
       let vcc = logon.instantiateViewController(identifier: "Login") as! LoginViewController
        navigationController?.pushViewController(vcc, animated: true)
    }
    
    @IBAction func termsConditionPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func privacyPolicyPressed(_ sender: UIButton) {
        
    }
}


struct CreateUser: Codable {
    let firstname: String
    let lastname: String
    let email: String
    let password: String
    let password_confirmation: String
}
