//
//  Joueur.swift
//  ColorJump
//
//  Created by Florian  on 23/04/2021.
//

import SpriteKit

class Joueur: SKShapeNode {
    
    func miseEnPlace(scene : SKScene){
        changerCouleur()
        position = CGPoint(x: scene.size.width / 2 , y: 200)
        
        zPosition = 1
        let body = SKPhysicsBody(circleOfRadius: 25)
        body.affectedByGravity = true
        body.categoryBitMask = MASK_JOUEUR
        body.collisionBitMask = MASK_SOL
        body.mass = 1.5
        physicsBody = body
    }
    
    func jump(){
        physicsBody?.velocity.dy = 350
    }

    func changerCouleur(){
    let couleur = COULEURS[Int(arc4random_uniform(UInt32(4)))]
    fillColor = couleur
    strokeColor = couleur
    }
}
