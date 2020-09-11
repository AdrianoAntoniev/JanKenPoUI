//
//  ChooseSkinViewController.swift
//  JanKenPoUI
//
//  Created by Adriano Rodrigues Vieira on 10/09/20.
//  Copyright © 2020 Adriano Rodrigues Vieira. All rights reserved.
//

import UIKit

class ChooseSkinViewController: UIViewController {
    @IBOutlet var skinButtons: [UIButton]!
    private var currentSkin: String = ""
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        for (index, skin) in Game.skinColorSamples.enumerated() {
            skinButtons[index].setTitle(String(skin), for: .normal)
        }
    }
    
    
    @IBAction func chooseSkinPressed(_ skinColorButton: UIButton) {
        if let skin = skinColorButton.currentTitle {
            currentSkin = skin
            performSegue(withIdentifier: K.MAIN_SCREEN_SEGUE, sender: nil)
        }
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if segue.identifier == K.MAIN_SCREEN_SEGUE {
            let mainVC = segue.destination as! ViewController
        
            mainVC.playerSkin = currentSkin
        }
    }
}
