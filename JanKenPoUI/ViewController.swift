//
//  ViewController.swift
//  JanKenPoUI
//
//  Created by Adriano Rodrigues Vieira on 09/09/20.
//  Copyright © 2020 Adriano Rodrigues Vieira. All rights reserved.
//

import UIKit

class ViewController: UIViewController {
    @IBOutlet weak var rock: UIButton!
    @IBOutlet weak var paper: UIButton!
    @IBOutlet weak var scissors: UIButton!
    @IBOutlet weak var myChooseLabel: UILabel!
    @IBOutlet weak var opponentChooseLabel: UILabel! {
        didSet {
            opponentChooseLabel.transform  = opponentChooseLabel.transform.rotated(by: CGFloat.pi)
        }
    }
    
    @IBOutlet weak var resultLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rock.setTitle(Hands.ROCK.rawValue, for: .normal)
        paper.setTitle(Hands.PAPER.rawValue, for: .normal)
        scissors.setTitle(Hands.SCISSORS.rawValue, for: .normal)
        
        myChooseLabel.text = ""
        opponentChooseLabel.text = ""
        
        resultLabel.text = ""
    }


    @IBAction func handChosen(_ hand: UIButton) {
        resultLabel.text = ""
        
        myChooseLabel.text = hand.currentTitle
        opponentChooseLabel.text = getRandomHand()
        
        performAnimation(in: myChooseLabel)
        performAnimation(in: opponentChooseLabel)
        
        if let myHand = myChooseLabel.text, let opponentHand = opponentChooseLabel.text {
            defineWinner(between: myHand, and: opponentHand)
        }
        
    }
    
    private func defineWinner(between player: String, and opponent: String) {        
        if player == opponent {
            resultLabel.text = Texts.DRAW
        } else {
            switch player {
            case Hands.PAPER.rawValue:
                if opponent == Hands.SCISSORS.rawValue {
                    resultLabel.text = Texts.LOSE
                } else {
                    resultLabel.text = Texts.WIN
                }
            case Hands.SCISSORS.rawValue:
                if opponent == Hands.PAPER.rawValue {
                    resultLabel.text = Texts.WIN
                } else {
                    resultLabel.text = Texts.LOSE
                }
            case Hands.ROCK.rawValue:
                if opponent == Hands.PAPER.rawValue {
                    resultLabel.text = Texts.LOSE
                } else {
                        resultLabel.text = Texts.WIN
                }
            default:
                break
            }
        }
        
    }
    
    private func getRandomHand() -> String {
        let hands = [Hands.ROCK.rawValue, Hands.PAPER.rawValue, Hands.SCISSORS.rawValue]
        
        return hands.randomElement()!
    }
    
    private func performAnimation(in label: UILabel) {
        UIViewPropertyAnimator.runningPropertyAnimator(
            withDuration: Measures.DURATION_OF_ANIMATION,
            delay: 0,
            options: [],
            animations: {
                label.transform = CGAffineTransform.identity.scaledBy(x: CGFloat(Measures.GROWN_SIZE_SCALE), y: CGFloat(Measures.GROWN_SIZE_SCALE))
            },
            completion: { position in
                UIViewPropertyAnimator.runningPropertyAnimator(
                    withDuration: Measures.DURATION_OF_ANIMATION,
                    delay: 0,
                    options: [],
                    animations: {
                        label.transform = CGAffineTransform.identity.scaledBy(x: CGFloat(Measures.NORMAL_SIZE_SCALE), y: CGFloat(Measures.NORMAL_SIZE_SCALE))
                    }
                )
            }
        )
    }
}
