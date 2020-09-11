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
    @IBOutlet weak var playerChooseLabel: UILabel!
    @IBOutlet weak var resultLabel: UILabel!
    
    var playerSkin: String?
    var opponentSkin: String?
    private var playerChoices: [String]?
    private var opponentChoices: [String]?
    
    @IBOutlet weak var opponentChooseLabel: UILabel! {
        didSet {
            opponentChooseLabel.transform  = opponentChooseLabel.transform.rotated(by: CGFloat.pi)
        }
    }
    
    override func viewDidLoad() {
        super.viewDidLoad()
        opponentSkin = Game.getRandomSkinColorSample()
    
        playerChoices = Game.getHandChoices(basedOnSkin: playerSkin!)
        opponentChoices = Game.getHandChoices(basedOnSkin: opponentSkin!)
        
        
        // TODO: Eliminar esses numeros magicos!
        rock.setTitle(playerChoices![0], for: .normal)
        paper.setTitle(playerChoices![1], for: .normal)
        scissors.setTitle(playerChoices![2], for: .normal)
        
        playerChooseLabel.text = ""
        opponentChooseLabel.text = ""
        
        resultLabel.text = ""
    }


    @IBAction func handChosen(_ hand: UIButton) {
        resultLabel.text = ""
        
        
        playerChooseLabel.text = hand.currentTitle
        opponentChooseLabel.text = opponentChoices!.randomElement()
        
        performAnimation(in: playerChooseLabel, withAdditionalAnimation: {})
        performAnimation(in: opponentChooseLabel, withAdditionalAnimation:
            {self.opponentChooseLabel.transform  = self.opponentChooseLabel.transform.rotated(by: CGFloat.pi)})
        
        Timer.scheduledTimer(withTimeInterval: 2.0, repeats: false) { (_) in
            if let playerHand = self.playerChooseLabel.text, let opponentHand = self.opponentChooseLabel.text {
                if let playerChoiceIndex = self.playerChoices?.firstIndex(of: playerHand),
                    let opponentChoiceIndex = self.opponentChoices?.firstIndex(of: opponentHand) {
                        self.resultLabel.text = Game.defineWinner(between: playerChoiceIndex, and: opponentChoiceIndex)
                }
            
                
            }
        }
    }
    
    private func performAnimation(in label: UILabel, withAdditionalAnimation additionalAnimation: @escaping () -> Void) {
        UIViewPropertyAnimator.runningPropertyAnimator(
            withDuration: Measures.DURATION_OF_ANIMATION,
            delay: Measures.DELAY_TIME,
            options: [],
            animations: {
                label.transform = CGAffineTransform.identity.scaledBy(x: CGFloat(Measures.GROWN_SIZE_SCALE), y: CGFloat(Measures.GROWN_SIZE_SCALE))
                additionalAnimation()
            },
            completion: { position in
                UIViewPropertyAnimator.runningPropertyAnimator(
                    withDuration: Measures.DURATION_OF_ANIMATION,
                    delay: Measures.DELAY_TIME,
                    options: [],
                    animations: {
                        label.transform = CGAffineTransform.identity.scaledBy(x: CGFloat(Measures.NORMAL_SIZE_SCALE), y: CGFloat(Measures.NORMAL_SIZE_SCALE))
                        additionalAnimation()
                    }
                )
            }
        )
    }
}
