//
//  extensionGameScne.swift
//  ColorJump
//
//  Created by Florian  on 12/05/2021.
//

import SpriteKit

extension GameScene: SKPhysicsContactDelegate{
    
    func didBegin(_ contact: SKPhysicsContact) {
        if let node1  = contact.bodyA.node as?  SKShapeNode{
            if let node2 = contact.bodyB.node as? SKShapeNode{
                if node1.fillColor != node2.fillColor{
                    // gameover
                }
            }
        }
    }
    
}
