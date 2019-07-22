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
        // Create a random number between 0 and 5.
        let fingers = arc4random_uniform(6)
        // These if statements will let the user know if they are correct, and also will let them know that they are
        // using a number that is too large.
        if guessTextField.text != "" {
            // Convert fingers to a string to compare it to the guess.
            if String(fingers) == guessTextField.text {
                resultLabel.text = "Correct! You Got It!"
            // Now we change the guess to an int to make sure that the number is in the appropriate range.
            } else if Int(guessTextField.text!)! > 5 {
                resultLabel.text = "I don't have more than 5 fingers..."
            // Feedback for an incorrect answer.
            } else {
                resultLabel.text = "I'm Sorry it was \(fingers). Try Again!"
            }
        }
        // This will close the keyboard after the button is pressed.
        self.view.endEditing(true)
    }
}
