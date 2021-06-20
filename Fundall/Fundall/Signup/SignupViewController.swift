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
        
        
    }
    func signToHome() {
        let goHome = UIStoryboard(name: "Homepage", bundle: nil)
        let homeVC = goHome.instantiateViewController(identifier: "Home") as! HomepageViewController
        navigationController?.pushViewController(homeVC, animated: true)
    }
    
    @IBAction func eyeSecureTapped(_ sender: UIButton) {
        passwordField.isSecureTextEntry.toggle()
        let imageName = passwordField.isSecureTextEntry ? "eye" : "eye.slash"
        eyeSecureButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    @IBAction func inviteCode(_ sender: UIButton) {
        
    }
    
    @IBAction func signupPressed(_ sender: UIButton) {
        
        guard let email_ = self.emailField.text else {return}
        guard  let password = passwordField.text  else {return}
        guard  let fName = firstName.text  else {return}
        guard let lName = lastName.text else {return}
        guard let confirmPassword = passwordField.text else {return}
        
        let register = RegisterModel(firstname: fName, lastname: lName, email: email_, password: password, password_confirmation: confirmPassword)
        
        APIManager.shareInstance.fetchRegisterAPI(register: register)
        { (isSuccess) in
            if isSuccess {
                AlertController.showAlert(self, title: "Alert!!!", message: "User register successfully")
            } else {
                AlertController.showAlert(self, title: "Alert!!!", message: "Please try again")
            }
        }
        
        if email_.isValidEmail == false && password == "" {
            let videoAlert = UIAlertController(title: "Login Error", message: "Please enter a valid email and password", preferredStyle: .alert)
            videoAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
            present(videoAlert, animated: true, completion: nil)
        }
        
        if  email_.isValidEmail == true && password != "" {
            let alertController =
                UIAlertController(title: "Done",
                                  message: "Account created successfully!", preferredStyle: .alert)
            let acceptAction = UIAlertAction(title: "Accept", style: .default) { (_) -> Void in
                self.signToHome()
            }
            alertController.addAction(acceptAction)
            self.present(alertController, animated: true, completion: nil)
            
        }
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

