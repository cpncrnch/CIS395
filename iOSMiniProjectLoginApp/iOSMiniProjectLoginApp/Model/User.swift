/*
Brian Brown, S00709110
Dr. Bhavana Bhardwaj
CIS 0395 App Development for iOS Device
M, W 12 - 12:50 p.m.
Assignment: MVC
Due Date: 9/28/26
*/
//  User.swift
//  iOSMiniProjectLoginApp
//
//  Created by Brian Brown on 9/18/26.

import Foundation

// Creates a structure to store user information
struct User {
   let firstName, lastName, email: String
   let age: Int
   let location: Location // structure within structure
}

// Creates a structure to store latitude / longitude info
struct Location {
   let lat: Double
   let lng: Double
}
