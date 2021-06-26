//
//  LoginViewController.swift
//  Fundall
//
//  Created by apple on 14/06/2021.
//

import UIKit

class LifestyleViewController: UIViewController {
    @IBOutlet weak var firstName: UILabel!
    @IBOutlet weak var notFirstName: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        navigationController?.navigationBar.isHidden = true
    }
    
    @IBAction func lockTapped(_ sender: UIButton) {
        let lockVC = UIStoryboard(name: "Welcome", bundle: nil)
        let WelcomeVC = lockVC.instantiateViewController(identifier: "Welcome") as! WelcomeBackViewController
        navigationController?.pushViewController(WelcomeVC, animated: true)
    }
    
    @IBAction func biometricTapped(_ sender: UIButton) {
    }
    
    @IBAction func switchAccountPressed(_ sender: UIButton) {
        let switchVC = UIStoryboard(name: "Login", bundle: nil)
        let lifeVC = switchVC.instantiateViewController(identifier: "Login") as! LoginViewController
        navigationController?.pushViewController(lifeVC, animated: true)
    }
    
    @IBAction func createAccountPressed(_ sender: UIButton) {
        navigationController?.popViewController(animated: true)
    }
}
