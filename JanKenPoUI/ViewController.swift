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
    @IBOutlet weak var opponentChooseLabel: UILabel!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        rock.setTitle("✊", for: .normal)
        paper.setTitle("🖐", for: .normal)
        scissors.setTitle("✌️", for: .normal)
        
        myChooseLabel.text = ""
        opponentChooseLabel.text = ""
        opponentChooseLabel.transform = CGAffineTransform(rotationAngle: CGFloat.pi)
        
        
    }


    @IBAction func handChosen(_ hand: UIButton) {
        myChooseLabel.text = hand.currentTitle
        opponentChooseLabel.text = getRandomHand()
    }
    
    private func getRandomHand() -> String {
        let hands = ["✊", "🖐", "✌️"]
        
        return hands.randomElement()!
    }
}

//
//extension Array {
//    var randomElementPriquito: Element {
//        let randomIndex = Int(arc4random_uniform(UInt32(self.count)))
//        return self[randomIndex]
//    }
//}
