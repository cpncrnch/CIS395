//
//  ViewController.swift
//  ProgrammaticViewAssignment
//
//  Created by Brian Brown on 9/14/26.
//

import UIKit

class ViewController: UIViewController {

   // creates label2 so buttonPressed can access it but does not display any text yet
   let label2 = UILabel()
  
   
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view.

      // view background color setting
      view.backgroundColor = .systemCyan
      print("View got loaded") // prints message to terminal
      
      // label1 creation
      let label1 = UILabel()
      
      // sets up label1 text
      label1.text = "Welcome to iOS Development!"
      label1.textColor = .white
      label1.textAlignment = .center
      label1.font = UIFont.systemFont(ofSize: 30)
      // allows label1 to use as many lines as needed
      label1.numberOfLines = 0

      // disables automatically generated constraints
      label1.translatesAutoresizingMaskIntoConstraints = false
      
      view.addSubview(label1)
      
      
      // label2 setup
      // sets up label text settings
      label2.textColor = .white
      label2.textAlignment = .center
      label2.font = UIFont.systemFont(ofSize: 25)
      
      // disables automatically generated constraints
      label2.translatesAutoresizingMaskIntoConstraints = false
      
      view.addSubview(label2)

      
      // button creation
      let clickMeButton = UIButton(type: .system)
      
      clickMeButton.setTitle("Press Me", for: .normal)
      // sets font size
      clickMeButton.titleLabel?.font = UIFont.systemFont(ofSize: 20)

      // sets button coloring
      clickMeButton.setTitleColor(.white, for: .normal)
      clickMeButton.backgroundColor = .blue

      // rounds button corners by 15 points
      clickMeButton.layer.cornerRadius = 15
      
      // disables automatically generated constraints
      clickMeButton.translatesAutoresizingMaskIntoConstraints = false
      // adds button to view
      view.addSubview(clickMeButton)

      
      // activates custom Auto Layout constraints
      NSLayoutConstraint.activate([
      
      // Position label1
      // sets label1 horz position center to center of view
      label1.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      // sets label1 vert position center to 100 points above center of view
      label1.centerYAnchor.constraint(equalTo: view.centerYAnchor, constant: -100),
      // limits label1's frame width to 90% of the main view  width, combined with numberOfLines = 0, this gives the text a boundary and forces it to wrap onto additional lines
      label1.widthAnchor.constraint(
          equalTo: view.widthAnchor,
          multiplier: 0.9
      ),

      
      // Position button
      // sets button horz position center to center of view
      clickMeButton.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      // sets button vert position to top 20 points below bottom of label1
      clickMeButton.topAnchor.constraint(equalTo: label1.bottomAnchor, constant: 20),
      // sets button width to 50% of the view width
      clickMeButton.widthAnchor.constraint(equalTo: view.widthAnchor, multiplier: 0.5),
      // sets button height to 50 points
      clickMeButton.heightAnchor.constraint(equalToConstant: 50),
         
      // Position label2
      // sets label2 horz position center to center of view
      label2.centerXAnchor.constraint(equalTo: view.centerXAnchor),
      // sets label2 vert position: label2 top 20 points below button bottom
      label2.topAnchor.constraint(equalTo: clickMeButton.bottomAnchor, constant: 20),
      ])

      // runs the buttonPressed function when button is pressed
      clickMeButton.addTarget(self, action: #selector(buttonPressed), for: .touchUpInside)
   }

   // Button pressed function
   @objc func buttonPressed() {
      // prints message to terminal
      print("Button pressed! Good job")
      
      // display label2 text
      label2.text = "Excellent!"
   }

}

