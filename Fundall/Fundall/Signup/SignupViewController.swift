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
        let email_ = email
       guard  let password = passwordField.text  else {return}
       guard  let firstName = firstName.text  else {return}
       guard let lastName = lastName.text else {return}
       guard let phoneNumber = phoneNumber.text  else {return}
       
       if email_.isValidEmail == false && password == "" {
           let videoAlert = UIAlertController(title: "Login Error", message: "You have provided invalid email or password. Please check and try again", preferredStyle: .alert)
           videoAlert.addAction(UIAlertAction(title: "OK", style: .default, handler: nil))
           present(videoAlert, animated: true, completion: nil)
        }

                if  email_.isValidEmail == true && password != "" {
                    LoginPls()
                }
    //MARK:- NETWORK CALLS START
        
        //declare parameter as a dictionary which contains string as key and value combination. considering inputs are valid
        
        func LoginPls() {
            let parameters = ["email": email_, "password": password,"firstName":firstName,"lastName":lastName,"phoneNumber":phoneNumber] as [String : Any]

            //create the url with URL
            let url = URL(string: "https://campaign.fundall.io/api/v1/register")!

            //create the session object
            let session = URLSession.shared

            //now create the URLRequest object using the url object
            var request = URLRequest(url: url)
            request.httpMethod = "POST" //set http method as POST

            do {
                request.httpBody = try JSONSerialization.data(withJSONObject: parameters, options: .prettyPrinted) // pass dictionary to nsdata object and set it as request body
            } catch let error {
                print(error.localizedDescription)
            }

            request.addValue("application/json", forHTTPHeaderField: "Content-Type")
            request.addValue("application/json", forHTTPHeaderField: "Accept")

            //create dataTask using the session object to send data to the server
            let task = session.dataTask(with: request as URLRequest, completionHandler: { data, response, error in

                guard error == nil else {
                    return
                }

                guard let data = data else {
                    return
                }

                do {
                    //create json object from data
                    if let json = try JSONSerialization.jsonObject(with: data, options: .mutableContainers) as? [String: Any] {
                        print(json)
                        
                        if let httpResponse = response as? HTTPURLResponse {
                            print(" \(httpResponse.statusCode)")
                            
                        }
//                            if httpResponse == "400" {
//
//                            }
//                        }
                        }
                } catch let error {
                    print(error.localizedDescription)
                }
            })
            task.resume()
            
        }
    }
    
    
    @IBAction func loginPressed(_ sender: UIButton) {
        
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
