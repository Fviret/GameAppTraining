//
//  GameScene.swift
//  ColorJump
//
//  Created by Florian  on 23/04/2021.
//

import SpriteKit
import GameplayKit

class GameScene: SKScene {
    
    let cameraNode = SKCameraNode()
    let sol = Sol()
    var joueur : Joueur?
    var scoreLabel = ScoreLabel()
    var scorePlayer = 0
    var obstacles = [Obstacle]()
    let espacement : CGFloat = 750
    
    var gameOverLabel : ScoreLabel?
    
    
    override func didMove(to view: SKView) {
        physicsWorld.gravity.dy = -5
        physicsWorld.contactDelegate = self
         
        camera = cameraNode
        addChild(cameraNode)
        cameraNode.position = CGPoint(x: size.width / 2, y: size.height / 2)
        sol.miseEnPlaceSol(scene: self)
        addChild(sol)
        
        scoreLabel.miseEnPlace(x: -(UIScreen.main.bounds.width / 1.8), y: -(UIScreen.main.bounds.height / 1.5))
        scoreLabel.ajoutTexte(String(scorePlayer))
        cameraNode.addChild(scoreLabel)
        
        ajouterJoueur()
        for _ in (0...2) {
            ajouterObstacle()
        }
        
    }
    
    func ajouterJoueur(){
        joueur = Joueur(circleOfRadius: 25)
        joueur?.miseEnPlace(scene: self)
        if joueur != nil{
            addChild(joueur!)
        }
    }
    
    func ajouterObstacle(){
        let obstacle: Obstacle?
        if aleatoire(){
            obstacle = Cercle()
        }else{
            obstacle = Carre()
        }
        obstacle?.miseEnPlace()
        if obstacle != nil {
            obstacles.append(obstacle!)
            obstacle?.position = CGPoint(x: cameraNode.frame.midX, y: espacement * CGFloat(obstacles.count))
            addChild(obstacle!)
        }
    }
    
  
    override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        if joueur != nil {
            joueur?.jump()
        }
        if gameOverLabel != nil {
            gameOverLabel?.removeFromParent()
            gameOverLabel = nil
            ajouterJoueur()
            for _ in (0...2){
                ajouterObstacle()
            }
            scorePlayer = 0
            scoreLabel.ajoutTexte(String(0))
            cameraNode.position = CGPoint(x: size.width / 2 , y: size.height / 2)
        }
    }
    
    override func update(_ currentTime: TimeInterval) {
        // Called before each frame is rendered
        guard joueur != nil else { return }
        let positionDeLaCamera = cameraNode.convert(joueur!.position, from: self)
        if positionDeLaCamera.y > 0 {
            cameraNode.position.y = joueur!.position.y
        }
        if positionDeLaCamera.y < (-size.height / 2) {
            gameOver()
        }
        if joueur!.position.y > espacement * CGFloat(obstacles.count - 2){
            scorePlayer += 1
            scoreLabel.ajoutTexte(String(scorePlayer))
            joueur?.changerCouleur()
            ajouterObstacle()
        }
    }
    
    
    
    func gameOver(){
        if joueur != nil{
            joueur?.removeFromParent()
            joueur = nil
        }
        for obstacle in obstacles {
            obstacle.removeFromParent()
        }
        obstacles.removeAll()
        gameOverLabel = ScoreLabel()
        gameOverLabel?.miseEnPlace(x: 0, y: 0)
        gameOverLabel?.ajoutTexte("Game Over \n Score: \(scorePlayer)")
        if gameOverLabel != nil{
            cameraNode.addChild(gameOverLabel!)
        }
        
    }
}


extension GameScene: SKPhysicsContactDelegate{
    
    func didBegin(_ contact: SKPhysicsContact) {
        if let node1  = contact.bodyA.node as?  SKShapeNode{
            if let node2 = contact.bodyB.node as? SKShapeNode{
                if node1.fillColor != node2.fillColor{
                   gameOver()
                }
            }
        }
    }
    
}
