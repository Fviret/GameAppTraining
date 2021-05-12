//
//  Sol.swift
//  ColorJump
//
//  Created by Florian  on 23/04/2021.
//

import SpriteKit

class Sol: SKNode {
    
    func miseEnPlaceSol(scene : SKScene){
        position = CGPoint(x: scene.size.width / 2, y: 20)
        let bodyFloor = SKPhysicsBody(rectangleOf: CGSize(width: scene.size.width, height: 1))
        bodyFloor.categoryBitMask = MASK_SOL
        bodyFloor.affectedByGravity = false
        bodyFloor.isDynamic = false
        physicsBody = bodyFloor
    }
}
