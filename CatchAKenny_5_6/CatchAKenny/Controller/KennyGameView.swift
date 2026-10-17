//
//  ViewController.swift
//  CatchAKenny
//
//  Created by Brian Brown on 10/6/26.
//

import UIKit

class ViewController: UIViewController {
   // kennys
   @IBOutlet weak var kenny1: UIImageView!

   @IBOutlet weak var kenny2: UIImageView!

   @IBOutlet weak var kenny3: UIImageView!

   @IBOutlet weak var kenny4: UIImageView!

   @IBOutlet weak var kenny5: UIImageView!

   @IBOutlet weak var kenny6: UIImageView!

   @IBOutlet weak var kenny7: UIImageView!

   @IBOutlet weak var kenny8: UIImageView!

   @IBOutlet weak var kenny9: UIImageView!

   // labels
   @IBOutlet weak var timeLabel: UILabel!

   @IBOutlet weak var scoreLabel: UILabel!

   @IBOutlet weak var highScoreLabel: UILabel!

   // reset button
   @IBOutlet weak var reset: UIButton!

   // variables
   var score = 0
   var highScore = 0
   var timer = Timer() // countdown timer
   var time = 0
   var hideTimer = Timer() // kenny popup timer
   var defaultTime = 10
   
   // kenny array
   var kennyArray = [UIImageView]()

   
   // main (viewDidLoad)
   override func viewDidLoad() {
      super.viewDidLoad()
      // Do any additional setup after loading the view.

      // sets game countdown time
      time = defaultTime
      
      // Sets screeen labels as needed
      scoreLabel.text = "Score: \(score)"

      // retrieves high score from device's small data storage
      highScore = UserDefaults.standard.integer(forKey: "highScore")
      
      highScoreLabel.text = "High Score: \(highScore)"

      timeLabel.text = "Time: \(time)"


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

      
      // Start game timer countdown
      timer = Timer.scheduledTimer(
          timeInterval: 1.0,
          target: self,
          selector: #selector(countdown),
          userInfo: nil,
          repeats: true
      )

      // Change the visible Kenny every half-second
      hideTimer = Timer.scheduledTimer(
         timeInterval: 0.5,
          target: self,
          selector: #selector(hideKenny),
          userInfo: nil,
          repeats: true
      )
      
      
      // fill kenny array
      kennyArray = [kenny1, kenny2, kenny3,
                    kenny4, kenny5, kenny6,
                    kenny7, kenny8, kenny9]

      // After filling kenny array, calls hideKenny to start game
      hideKenny()

   }  // end viewDidLoad

   
   // hides all nine Kennys, then shows 1 randomly picked Kenny
   @objc func hideKenny() {
       for kenny in kennyArray {
           kenny.isHidden = true
       }
      
      // randomly picks a number and THAT kenny appears
      let whichKenny = Int.random(in: 0..<kennyArray.count)
      kennyArray[whichKenny].isHidden = false
      
      print("Random Kenny: \(whichKenny)") // TEST: prints the random number being used

   }

   
   // increases score for each kenny "catch" and if the score is higher than the HighScore, make it the new HighScore
   @objc func increaseScore() {
      score += 1
      
      scoreLabel.text = "Score: \(score)"
      print ("Score: \(score)")

      // moving high score to game over
      // if score > highScore, makes highScore = score
//      if score > highScore {
//         highScore = score
//         highScoreLabel.text = "High Score: \(highScore)"
//      }

   }
   
   
   // counts down from time to 0, updates timer display and activates game over popup alert when time reaches 0
   @objc func countdown() {
      time -= 1 // decrements time each second
      
      timeLabel.text = "Time: \(time)" // adjust timer display
    
      // ends countdown timer at zero
      if time == 0 {
         // stops countdown timer firing
         timer.invalidate()
         
         // stops kenny popup timer firing
         hideTimer.invalidate()

         // hides last kenny
         for kenny in kennyArray {
             kenny.isHidden = true
         }
         
         
         // if score is higher than high score, makes it the new high score
         if score > highScore {
            highScore = score
            
            highScoreLabel.text = "High Score: \(highScore)"
            
            UserDefaults.standard.set(highScore, forKey: "highScore")
            
         }
         
         // Time's up Alert with option to play again or cancel
         let alert = UIAlertController(
            title: "Time's Up",
            message: "Do you want to play again?",
            preferredStyle: UIAlertController.Style.alert
         )
         
         // labeled the button Cancel instead of OK as OK sounds affirmative to the popup question.
         let cancelButton = UIAlertAction(title: "Cancel", style: UIAlertAction.Style.cancel, handler: nil
         )
         
         // Part 3.5.c: Replay uses style .default and includes a closure that calls replayGame().
         let replayButton = UIAlertAction(title: "Replay", style: .default) { (UIAlertAction) in self.replayGame()
         }
         
         alert.addAction(cancelButton)
         alert.addAction(replayButton)
         
         // presents alert as animation
         present(alert, animated: true, completion: nil)
      } // end if time up
      
   } // end countdown function
   
   // sets up a new game
   func replayGame() {
      resetScore()
      resetTime()
      
      // Start game timer countdown
      timer = Timer.scheduledTimer(
          timeInterval: 1.0,
          target: self,
          selector: #selector(countdown),
          userInfo: nil,
          repeats: true
      )

      // Change the visible Kenny every half-second
      hideTimer = Timer.scheduledTimer(
         timeInterval: 0.5,
          target: self,
          selector: #selector(hideKenny),
          userInfo: nil,
          repeats: true
      )

      

   }
   
   
   // resets score and score display to zero
   func resetScore() {
      score = 0
      
      scoreLabel.text = "Score: \(score)"
      print ("Score: \(score)")
   }

   
   // resets time and timer display to defaultTime
   func resetTime() {
      time = defaultTime
      
      timeLabel.text = "Time: \(time)"
      print ("Time: \(time)")
   }

   
   // resets high score to zero
   @IBAction func resetHighScore(_ sender: Any) {
      highScore = 0
      
      highScoreLabel.text = "High Score: \(highScore)"
      
      UserDefaults.standard.set(highScore, forKey: "highScore")
   }
   
} // end viewController class

