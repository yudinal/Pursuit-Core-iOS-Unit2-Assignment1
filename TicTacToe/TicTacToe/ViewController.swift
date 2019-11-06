//
//  ViewController.swift
//  TicTacToe
//
//  Created by Alex Paul on 11/8/18.
//  Copyright © 2018 Pursuit. All rights reserved.
//

import UIKit



class ViewController: UIViewController {
    
    @IBOutlet weak var gameStatus: UILabel!
    @IBOutlet var gameButtons: [UIButton]!
    @IBOutlet weak var playAgain: UIButton!
    
    var gameIsActive = true
    var gameState: Set<Set<Int>> = Set<Set<Int>>()
    var playerCross = Set<Int>()
    var playerCircle = Set<Int>()
    let winningCombo: Set<Set<Int>> = [[0, 1, 2],[3, 4, 5],[6, 7, 8],[0, 4, 8],[2, 4, 6],[0, 3, 6],[1, 4, 7],[2, 5, 8]]
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for button in gameButtons {
            button.setTitleColor(.clear, for: .normal)
        }
    }
    
    @IBAction func restart(_ sender: UIButton) {
       gameState = Set<Set<Int>>()
        gameIsActive = true
        playerCross = Set<Int>()
        playerCircle = Set<Int>()
        gameStatus.text = ""
        for button in gameButtons {
            button.setBackgroundImage(UIImage(named: "resetImage"), for: .normal)
            button.isEnabled = true
        }
        
    }
    
    @IBAction func gameButtonPressed(_ userInput: UIButton) {
 
        if playerCross.count == playerCircle.count {
            userInput.setBackgroundImage(UIImage(named: "xmark.png"), for: .normal)
            userInput.isEnabled = false
            playerCross.insert(userInput.tag-1)
        } else {
            userInput.setBackgroundImage(UIImage(named: "circle.png"), for: .normal)
            userInput.isEnabled = false
            playerCircle.insert(userInput.tag-1)
        }

        
        for combo in winningCombo {
            if combo.isSubset(of: playerCross) {
                gameStatus.text = "You win🎉🥇🏆"
                gameIsActive = false
                for button in gameButtons {
                    button.isEnabled = false
                }
            } else if combo.isSubset(of: playerCircle) {
                gameStatus.text = "🤦🏼‍♂️😿👎🏻"
               gameIsActive = false
                for button in gameButtons {
                    button.isEnabled = false
                }
            
            }
            
        }
       
    }
    
}

