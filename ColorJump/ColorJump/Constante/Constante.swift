//
//  File.swift
//  ColorJump
//
//  Created by Florian  on 23/04/2021.
//

import UIKit
import SpriteKit


let MASK_PERSOONE : UInt32 = 0
let MASK_JOUEUR : UInt32 = 1
let MASK_OBSTACLE : UInt32 = 2
let MASK_SOL : UInt32 = 4


let COULEURS = [SKColor.cyan, SKColor.red, SKColor.gray, SKColor.yellow]

func aleatoire() -> Bool {
    return arc4random_uniform(2) == 0
    
}
