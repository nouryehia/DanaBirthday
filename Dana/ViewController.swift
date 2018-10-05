/* ViewController.swift
   Dana
   App created to allow my little sister to guess her birthday present.
   Created by Nour Yehia on 8/3/18.
   Copyright © 2018 Nour Yehia. All rights reserved. */

import UIKit

class ViewController: UIViewController {
    
    // Array containing all the guessed letters.
    var guessedLetters: [Character] = []
    
    // String that will be later used for compairaison to see if the word was guessed.
    var guessedWord = ""
    
    // Formatted answer so only the letters that were guessed are seen.
    var word: String {
        var guessedWord = ""
        for letter in "PIANO" {
            if guessedLetters.contains(letter) {
                guessedWord += "\(letter)"
            }
            else {
                // If letter was not guessed, show an underscore.
                guessedWord += "_"
            }
        }
        return guessedWord
    }
    
    // Declare outlets.
    @IBOutlet weak var pianoLabel: UILabel!
    @IBOutlet var letters: [UIButton]!
    @IBOutlet weak var hintLabel: UILabel!
    
    // What to do when any one of the letters is tapped.
    @IBAction func letterTapped(_ sender: UIButton) {
        
        // Disable the button and change its color.
        sender.isEnabled = false
        sender.setTitleColor(.lightGray, for: .normal)
        
        // Add the letter to the array of guessed letters and update UI based on that.
        guessedLetters.append(Character(sender.title(for: .normal)!))
        updateUI()
        
        // Update the hint label to tell user whether word contains guessed letter.
        switch sender.title(for: .normal) {
            case "P", "I", "A", "N", "O":
                hintLabel.text = "Your gift has the letter \"\(sender.title(for: .normal)!)\"."
                if guessedWord == "P I A N O" {
                    performSegue(withIdentifier: "Final", sender: nil)
                }
            default:
                hintLabel.text = "Your gift does not have the letter \"\(sender.title(for: .normal)!)\"."
        }
    }
    
    // Updates user inteface.
    func updateUI() {
        // Create an empty array.
        var letters = [String]()
        // Add each character in the (letter or underscore) to the array.
        for letter in word {
            letters.append(String(letter))
        }
        // Put the letters in a string with spaces in between to show different underscore characters.
        guessedWord = letters.joined(separator: " ")
        // Update label.
        pianoLabel.text = guessedWord
    }
}
