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
        
        // This will look for a tap within the View Controller. If it finds a tap it will use the dimissKeyBoard function.
        let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action:Selector(("dismissKeyBoard")))
        view.addGestureRecognizer(tap)
    }
    
    // Add Objective-C function that dismisses the software keyboard.
    @objc func dismissKeyBoard() {
        view.endEditing(true)
    }

    @IBAction func guessTapped(_ sender: Any) {
        let fingers = arc4random_uniform(6)
        if guessTextField.text != "" {
            if String(fingers) == guessTextField.text {
                resultLabel.text = "Correct! You Got It!"
            } else if Int(guessTextField.text!)! > 5 {
                resultLabel.text = "I don't have more than 5 fingers..."
            } else {
                resultLabel.text = "I'm Sorry. Try Again!"
            }
        }
        // This will close the keyboard after the button is pressed.
        self.view.endEditing(true)
    }
}
