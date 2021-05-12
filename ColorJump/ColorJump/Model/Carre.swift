//
//  Carre.swift
//  ColorJump
//
//  Created by Florian  on 12/05/2021.
//

import SpriteKit

class Carre: Obstacle {
    
    override func miseEnPlace() {
        super.miseEnPlace()
    }
    
    override func creerForme() -> UIBezierPath? {
        return UIBezierPath(roundedRect: CGRect(x: -200, y: -200, width: 400, height: 40), cornerRadius: 50)
    }
}
