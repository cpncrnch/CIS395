/*
Brian Brown, S00709110
Dr. Bhavana Bhardwaj
CIS 0395 App Development for iOS Device
M, W 12 - 12:50 p.m.
Assignment: MVC
Due Date: 9/28/26
*/
//  LoginViewController.swift
//  DesignPattern

import UIKit

class LoginViewController: UIViewController {

   // Text entry fields
   @IBOutlet weak var emailField: UITextField!
   @IBOutlet weak var passwordField: UITextField!
    
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view.

      // add listeners
      emailField.addTarget(self, action: #selector(self.validateFields), for: .editingChanged)
      passwordField.addTarget(self, action: #selector(self.validateFields), for: .editingChanged)
       
   }
   
   // When button pressed, uses the email / password info to "login" to a simulated login service. If successfully logs in, goes to Homepage, else displays login failed message.
   @IBAction func loginBtnClicked(_ sender: UIButton) {
      NetworkServices.shared.login(email: emailField.text!, password: passwordField.text!) {success in
         // successful login goes to homepage
         if success {
            self.goToHomePage()
         } else {
            
            // login failed popup error message
            let alert = UIAlertController(
                title: "Login Failed",
                message: "Verify your login information and try again.",
                preferredStyle: .alert
            )
            alert.addAction(UIAlertAction(title: "OK", style: .default))
            
            // show alert message
            self.present(alert, animated: true)
            
            // login failed console error message
            print("Login failed")
         }
      }
   }

   // successful login opens HomePage
   func goToHomePage() {
      let controller = self.storyboard?.instantiateViewController(withIdentifier: "HomeViewController") as! HomeViewController
      
      // show HomeViewController
      self.present(controller, animated: true, completion: nil)
   }
   
   @IBOutlet weak var loginBtn: UIButton!
   
   // closes keyboard when touch occurs outside text field
   override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
         self.view.endEditing(true)
   }
   
   // function verifies text fields are both not empty, then enables the login button
   @objc private func validateFields() {
      
      // login disabled until both fields have info
      if emailField.text?.isEmpty == true || passwordField.text?.isEmpty == true {
         loginBtn.isEnabled = false
         return
      }
      else {
         loginBtn.isEnabled = true
         return
      }
   }
   
   
}
