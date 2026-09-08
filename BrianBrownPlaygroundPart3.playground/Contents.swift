/*
 Brian Brown, S00709110
 Dr. Bhavana Bhardwaj
 CIS 0340 Website Administration II
 M, W 10:00 - 10:50 a.m.
 Assignment: Playground Part 3
 Due Date: 9/11/26
 */

import UIKit

// Question 1:
func registerUser(email: String?, password: String?)
{
   // Check that email is not nil and unwrap its value.
   guard let unwrappedEmail = email
   else {
      // Error message if email is nil
      print("No email was provided. Please check your entry and try again.")
      return // Exits the function and returns to the caller
   }
   
   // Email is not nil, check whether it is empty
   if unwrappedEmail.isEmpty {
      // Error message if email is empty
      print("Email field is empty. Please enter email and try again")
      return
   }
   // Email is validated that it is not nil & not empty
   else {
      print("\(unwrappedEmail) is a valid email.")
   }
   
   // Check that password is not nil and unwrap its value.
   guard let unwrappedPassword = password else {
      // error message if password is nil
      print("No password was provided. Please check your entry and try again.")
      return
   }
   
   // Password is not nil, check whether it is empty
   if unwrappedPassword.isEmpty {
      print("Password field is empty. Please enter password and try again")
      return
   }
   // Password is not nil or empty, check whether it is less than 6 charsacters
   else if unwrappedPassword.count < 6 {
      print("Invalid password. Password must contain 6 characters or more.")
      return
   }
   // Password is validated that it is not nil, not empty & 6 chars or more
   else {
      print("\(unwrappedPassword) is a valid password.")
   }
}

// TESTS:
registerUser(email: "tester@gmail.com", password: "123456") // valid test
//registerUser(email: nil, password: "1234") // fails nil email
//registerUser(email: "tester@gmail.com", password: nil) // fails nil password
//registerUser(email: "", password: "1234") // fails empty email
//registerUser(email: "tester@gmail.com", password: "") // fails empty password
//registerUser(email: "tester@gmail.com", password: "12345") // fails too few chars password


// Question 2:
// Create class
class Car {
   // Properties
   var brand: String
   var model: String
   var year: Int
   
   // Initialize properties
   init(brand: String, model: String, year: Int) {
      self.brand = brand
      self.model = model
      self.year = year
   }
   
   // Create print details display method
//    func displayDetails() {
//        print("My car is a \(year) \(brand) \(model).")
//    }
   
   // Changed print display details method so now returns car details as a String for printing
   func displayDetails() -> String {
      return "My car is a \(year) \(brand) \(model). "
   }
}

//TESTS:
// Create class instances
let myCar = Car(
   brand: "Chevy",
   model: "Corvette",
   year: 1960 )
let myCar1 = Car(
   brand: "Shelby",
   model: "GT-500 Mustang",
   year: 1957 )
let myCar2 = Car(
   brand: "Pontiac",
   model: "Firebird Trans Am",
   year: 1979 )

// Calls class display details method
//myCar.displayDetails() // print details display method
// return as a String for printing method
print(myCar.displayDetails())

//myCar1.displayDetails()
print(myCar1.displayDetails())

//myCar2.displayDetails()
print(myCar2.displayDetails())


// Question 3:
// Create subclass
class ElectricCar: Car {
   // Additional subclass property
   var batteryCapacity: Int
   
   // Initialize subclass & inherited properties
   init(
      brand: String,
      model: String,
      year: Int,
      batteryCapacity: Int) {
         // Initializes subclass property
         self.batteryCapacity = batteryCapacity

         // Calls the parent class initializer for inherited properties
         super.init(
            brand: brand,
            model: model,
            year: year )
      }
   
   // Override display details method and adds battery capacity to parent class details
//    override func displayDetails() { print("My car is a \(year) \(brand) \(model). My car has a battery capacity of \(batteryCapacity)")
//    }
   
   // Changed print display details override method so now returns car details as a String for printing
   override func displayDetails() -> String {
      super.displayDetails() +
      "My car has a battery capacity of \(batteryCapacity) kWh."
   }
}

// Create subclass instance
let myElectricCar = ElectricCar (brand: "Rimac", model: "Nevera", year: 2026, batteryCapacity: 107)

// Calls subclass display details method
//myElectricCar.displayDetails()
print(myElectricCar.displayDetails())
