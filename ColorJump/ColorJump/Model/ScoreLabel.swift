//
//  ScoreLabel.swift
//  ColorJump
//
//  Created by Florian  on 10/05/2021.
//

import UIKit
import SpriteKit

class ScoreLabel: SKLabelNode {
    
    func miseEnPlace(x: CGFloat, y : CGFloat){
        position = CGPoint(x: x, y: y)
        fontName = "Helvetica Neue"
        fontColor = .white
        fontSize = 100
        numberOfLines = 2
         
    }
    func ajoutTexte(_ string : String){
        text = string
    }
}
