/*
Brian Brown, S00709110
Dr. Bhavana Bhardwaj
CIS 0395 App Development for iOS Device
M, W 12 - 12:50 p.m.
Assignment: MVC
Due Date: 9/28/26
*/
//  NetworkServices.swift
//  iOSMiniProjectLoginApp
//
//  Created by Brian Brown on 9/18/26.

import Foundation

// Singleton class
class NetworkServices {
  static let shared = NetworkServices() // Singleton instance
   
  // Prevents multiple instances
  private init() {
      
  }
  
  // creates a user variable to store logged in user info
  private var user: User?
  
  // Network login simulation for user
  func login(email: String, password: String, completion: @escaping(Bool) -> Void){

      // Runs network login simulation in background
      DispatchQueue.global().async {
         sleep(1) // 1 sec delay
         
         // Returns to main
         DispatchQueue.main.async {
            
            // user info condition check
            if email == "Brian@test.com" && password == "abc123" {
               
               // successful login so this is user's info
               self.user = User(
                  firstName: "Brian",
                  lastName: "Brown",
                  email: "Brian@test.com",
                  age: 65,
                  location: Location(
                     lat: 30.3759,
                     lng: -86.3715
                  )
               )
               
               completion(true) // sends successful login result back
            } else {
               
               // user log in incorrect
               self.user = nil
               completion(false) // sends fasiled login result back
            }
         }
      }
   }
   
   // Simulate
   // user! forcing user as we have user for sure
   func getLoggedInUser() -> User {
      return user!
   }
}
