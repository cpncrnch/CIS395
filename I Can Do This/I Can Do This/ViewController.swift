//
//  ViewController.swift
//  I Can Do This
//
//  Created by Brian Brown on 8/19/26.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var image: UIImageView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
    }
    
    @IBAction func clickHereButton(_ sender: Any) {
        
        if image.image == UIImage(named: "beachSunset") {
            image.image = UIImage(named: "beachDay")
        } else {
            image.image = UIImage(named: "beachSunset")
        }
              
    }
    
}

