/*
Brian Brown, S00709110
Dr. Bhavana Bhardwaj
CIS 0395 App Development for iOS Device
M, W 12 - 12:50 p.m.
Assignment: MVC
Due Date: 9/28/26
*/
//  HomeViewController.swift
//  DesignPattern

import UIKit

class HomeViewController: UIViewController {

   @IBOutlet weak var welcomeLbl: UILabel!
   
   // user variable for user's info
   var user: User!
   
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view.

      // gets user info from simlated network
      user = NetworkServices.shared.getLoggedInUser()
      welcomeUser()
   }
   
   // welcome message using user email
   func welcomeUser() {
      welcomeLbl.text = "Welcome, \(user?.email ?? "User")!"
   }

   /*
   // MARK: - Navigation

   // In a storyboard-based application, you will often want to do a little preparation before navigation
   override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
      // Get the new view controller using segue.destination.
      // Pass the selected object to the new view controller.
   }
   */
}
