//
//  CreateAccoutViewController.swift
//  Fundall
//
//  Created by apple on 14/06/2021.
//

import UIKit

class LoginViewController: UIViewController {
    @IBOutlet weak var emailField: UITextField!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var passwordSecure: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        // Do any additional setup after loading the view.
    }
    
    func navToHome() {
        let logVC = UIStoryboard(name: "Homepage", bundle: nil)
        let logVCC = logVC.instantiateViewController(identifier: "Home") as! HomepageViewController
        navigationController?.pushViewController(logVCC, animated: true)
    }
    
    @IBAction func securePassword(_ sender: UIButton) {
        passwordField.isSecureTextEntry.toggle()
        let imageName = passwordField.isSecureTextEntry ? "eye.slash" : "eye"
        passwordSecure.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        guard let email = emailField.text?.lowercased() else {return}
        guard  let password = passwordField.text  else {return}
        let login = LoginModel(email: email, password: password)
        APIManager.shareInstance.fetchLoginAPI(login: login) { (result) in
            switch result{
            case .success(let json):
                print(json as AnyObject)
                let alertController =
                    UIAlertController(title: "Login",
                                      message: "Login successfully!", preferredStyle: .alert)
                let acceptAction = UIAlertAction(title: "Click to continue", style: .default) { (_) -> Void in
                    self.navToHome()
                }
                alertController.addAction(acceptAction)
                self.present(alertController, animated: true, completion: nil)
                
            case .failure(let err):
                print(err.localizedDescription)
                let verifyInput = UIAlertController(title: "Login Error", message: "You have provided invalid email or password. Please check and try again", preferredStyle: .alert)
                verifyInput.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
                self.present(verifyInput, animated: true, completion: nil)
            }
        }
        
    }
    
    @IBAction func createAccountPressed(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
    
    @IBAction func forgotPasswordPressed(_ sender: UIButton) {
    }
}
