//
//  ViewController.swift
//  CatchAKenny
//
//  Created by Brian Brown on 10/6/26.
//

import UIKit

class ViewController: UIViewController {
   
   @IBOutlet weak var kenny1: UIImageView!

   @IBOutlet weak var kenny2: UIImageView!
   
   @IBOutlet weak var kenny3: UIImageView!
   
   @IBOutlet weak var kenny4: UIImageView!
   
   @IBOutlet weak var kenny5: UIImageView!
   
   @IBOutlet weak var kenny6: UIImageView!
   
   @IBOutlet weak var kenny7: UIImageView!
   
   @IBOutlet weak var kenny8: UIImageView!
   
   @IBOutlet weak var kenny9: UIImageView!

   
   @IBOutlet weak var timeLabel: UILabel!
   
   @IBOutlet weak var scoreLabel: UILabel!
   
   @IBOutlet weak var highScoreLabel: UILabel!
   
   
   @IBOutlet weak var reset: UIButton!
   
   
   var score = 0
   var highScore = 0 // later will need to read from user dafault instead

   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view.
      
      // Sets screeen labels as needed
      scoreLabel.text = "Score: \(score)"
   
      highScoreLabel.text = "High Score: \(highScore)"

      
      // sets up each kenny with tap gesture user interaction and calls increaseScore to increment score
      let recognizer1 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
      kenny1.addGestureRecognizer(recognizer1)
      kenny1.isUserInteractionEnabled = true
      
      let recognizer2 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
      kenny2.addGestureRecognizer(recognizer2)
      kenny2.isUserInteractionEnabled = true

      let recognizer3 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
      kenny3.addGestureRecognizer(recognizer3)
      kenny3.isUserInteractionEnabled = true
      
      let recognizer4 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
      kenny4.addGestureRecognizer(recognizer4)
      kenny4.isUserInteractionEnabled = true

      let recognizer5 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
      kenny5.addGestureRecognizer(recognizer5)
      kenny5.isUserInteractionEnabled = true
      
      let recognizer6 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
      kenny6.addGestureRecognizer(recognizer6)
      kenny6.isUserInteractionEnabled = true

      let recognizer7 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
      kenny7.addGestureRecognizer(recognizer7)
      kenny7.isUserInteractionEnabled = true
      
      let recognizer8 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
      kenny8.addGestureRecognizer(recognizer8)
      kenny8.isUserInteractionEnabled = true

      let recognizer9 = UITapGestureRecognizer(target: self, action: #selector(increaseScore))
      kenny9.addGestureRecognizer(recognizer9)
      kenny9.isUserInteractionEnabled = true
     
     
   }  // end viewDidLoad

   
   // reset button resets score and score display to play again
   @IBAction func resetScore(_ sender: UIButton) {
      score = 0
      scoreLabel.text = "Score: \(score)"
      print ("Score: \(score)")
      
   }
  
   
   // increases Score for each kenny "catch" and if the Score is higher than the HighScore, make it the new HighScore. highScore is NOT persistent yet!
   @objc func increaseScore() {
      score += 1
      scoreLabel.text = "Score: \(score)"
      print ("Score: \(score)")
      
      if score > highScore {
         highScore = score
         highScoreLabel.text = "High Score: \(highScore)"
      }

   }
   
  
}

