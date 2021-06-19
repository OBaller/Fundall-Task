//
//  WelcomeBackViewController.swift
//  Fundall
//
//  Created by apple on 14/06/2021.
//

import UIKit

class WelcomeBackViewController: UIViewController {
    @IBOutlet weak var userAvatar: UIImageView!
    @IBOutlet weak var userGreeting: UILabel!
    @IBOutlet weak var userEmailLabel: UILabel!
    @IBOutlet weak var passwordField: UITextField!
    @IBOutlet weak var secureButton: UIButton!
    
    override func viewDidLoad() {
        super.viewDidLoad()

        // Do any additional setup after loading the view.
    }
    

    @IBAction func eyeButtonTapped(_ sender: UIButton) {
        passwordField.isSecureTextEntry.toggle()
        let imageName = passwordField.isSecureTextEntry ? "eye.slash" : "eye"
        secureButton.setImage(UIImage(systemName: imageName), for: .normal)
    }
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
    }
    
    @IBAction func createAccountPressed(_ sender: UIButton) {
        
    }
}
