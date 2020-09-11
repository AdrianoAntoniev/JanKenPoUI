//
//  Game.swift
//  JanKenPoUI
//
//  Created by Adriano Rodrigues Vieira on 10/09/20.
//  Copyright © 2020 Adriano Rodrigues Vieira. All rights reserved.
//

import Foundation

struct Game {
    private static let handShapesBySkinColor = ["👍" : ["✊", "🖐", "✌️"],
                                                "👍🏻" : ["✊🏻", "🖐🏻", "✌🏻"],
                                                "👍🏼" : ["✊🏼", "🖐🏼", "✌🏼"],
                                                "👍🏽" : ["✊🏽", "🖐🏽", "✌🏽"],
                                                "👍🏾" : ["✊🏾", "🖐🏾", "✌🏾"],
                                                "👍🏿" : ["✊🏿", "🖐🏿", "✌🏿"]]
    
    
    static let skinColorSamples = handShapesBySkinColor.flatMap { $0.0 }
    
    static func getRandomSkinColorSample() -> String {
        return String(Game.skinColorSamples.randomElement()!)
    }
    
    static func getHandChoices(basedOnSkin skin: String) -> [String] {
        return handShapesBySkinColor[skin]!
    }
    
    static func defineWinner(between playerIndex: Int, and opponentIndex: Int) -> String {
        var result = ""
        
        if playerIndex == opponentIndex {
            result = Texts.DRAW
        } else {
            switch playerIndex {
            case 0:
                if opponentIndex == 1 {
                    result = Texts.LOSE
                } else {
                    result = Texts.WIN
                }
            case 1:
                if opponentIndex == 0 {
                    result = Texts.WIN
                } else {
                    result = Texts.LOSE
                }
            case 2:
                if opponentIndex == 0 {
                    result = Texts.LOSE
                } else {
                    result = Texts.WIN
                }
            default:
                break
            }
        }
        return result
    }
}
