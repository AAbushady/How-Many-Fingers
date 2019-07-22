//
//  ViewController.swift
//  How Many Fingers
//
//  Created by Alexander Abushady on 7/22/19.
//  Copyright © 2019 Alexander Abushady. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    
    @IBOutlet weak var guessTextField: UITextField!
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
    }

    @IBAction func guessTapped(_ sender: Any) {
        let fingers = arc4random_uniform(6)
        if guessTextField.text != "" {
            if String(fingers) == guessTextField.text {
                resultLabel.text = "Correct! You Got It!"
            } else {
                resultLabel.text = "I'm Sorry. Try Again!"
            }
        }
    }
}
