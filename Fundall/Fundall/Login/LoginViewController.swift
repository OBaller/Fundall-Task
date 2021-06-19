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
    
    @IBAction func securePassword(_ sender: UIButton) {
        passwordField.isSecureTextEntry.toggle()
        let imageName = passwordField.isSecureTextEntry ? "eye.slash" : "eye"
        passwordSecure.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        let logVC = UIStoryboard(name: "Homepage", bundle: nil)
          let logVCC = logVC.instantiateViewController(identifier: "Home") as! HomepageViewController
          navigationController?.pushViewController(logVCC, animated: true)
    }
    
    @IBAction func createAccountPressed(_ sender: UIButton) {
        navigationController?.popToRootViewController(animated: true)
    }
}


struct AuthenticateUser: Codable {
    let email: String
    let password: String
}
