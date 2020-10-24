//
//  GameScene.swift
//
//  Created by Sufiandy Elmy on 14/05/2020.
//  Copyright © 2019 Elmy. All rights reserved.
//

import SpriteKit


func +(left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x + right.x, y: left.y + right.y)
}

func -(left: CGPoint, right: CGPoint) -> CGPoint {
    return CGPoint(x: left.x - right.x, y: left.y - right.y)
}

func *(point: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: point.x * scalar, y: point.y * scalar)
}

func /(point: CGPoint, scalar: CGFloat) -> CGPoint {
    return CGPoint(x: point.x / scalar, y: point.y / scalar)
}

#if !(arch(x86_64) || arch(arm64))
func sqrt(a: CGFloat) -> CGFloat {
    return CGFloat(sqrtf(Float(a)))
}
#endif

extension CGPoint {
    func length() -> CGFloat {
        return sqrt(x*x + y*y)
    }
    
    func normalized() -> CGPoint {
        return self / length()
    }
}

public class GameScene: SKScene {
    
    struct PhysicsCategory {
        static let none      : UInt32 = 0
        static let all       : UInt32 = UInt32.max
        static let corona   : UInt32 = 0b1       // 1
        static let projectile: UInt32 = 0b10      // 2
    }
    
    // 1
    let player = SKSpriteNode(texture: SKTexture(image :#imageLiteral(resourceName: "Player.png")))
    var coronaDestroyed = 0
    
    override public func didMove(to view: SKView) {
        // 2
        //backgroundColor = .brown
        let backgroundImage = SKSpriteNode(texture: SKTexture(image: #imageLiteral(resourceName: "jakarta.png")))
        backgroundImage.setScale(1.1)
        backgroundImage.zPosition = -10
        backgroundImage.position = CGPoint(x: frame.midX, y: frame.midY)
        addChild(backgroundImage)
        // 3
        player.position = CGPoint(x: size.width * 0.1, y: size.height * 0.5)
        // 4
        addChild(player)
        
        physicsWorld.gravity = .zero
        physicsWorld.contactDelegate = self
        
        run(SKAction.repeatForever(
            SKAction.sequence([
                SKAction.run(addCorona),
                SKAction.wait(forDuration: 2.0)
            ])
        ))
        
        let backgroundMusic = SKAudioNode(fileNamed: "soundback.m4a")
        backgroundMusic.autoplayLooped = true
        addChild(backgroundMusic)
    }
    
    func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 0xFFFFFFFF)
    }
    
    func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
    
    func addCorona() {
        // Create sprite
        let corona = SKSpriteNode(texture: SKTexture(image :#imageLiteral(resourceName: "corona.png")))
        
        corona.physicsBody = SKPhysicsBody(rectangleOf: corona.size) // 1
        corona.physicsBody?.isDynamic = true // 2
        corona.physicsBody?.categoryBitMask = PhysicsCategory.corona  // 3
        corona.physicsBody?.contactTestBitMask = PhysicsCategory.projectile // 4
        corona.physicsBody?.collisionBitMask = PhysicsCategory.none // 5
        
        // Determine where to spawn the corona along the Y axis
        let actualY = random(min: corona.size.height/2, max: size.height - corona .size.height/2)
        
        // Position the corona slightly off-screen along the right edge,
        // and along a random position along the Y axis as calculated above
        corona.position = CGPoint(x: size.width + corona.size.width/2, y: actualY)
        
        // Add the corona to the scene
        addChild(corona)
        
        // Determine speed of the corona
        let actualDuration = random(min: CGFloat(2.0), max: CGFloat(4.0))
        
        // Create the actions
        let actionMove = SKAction.move(to: CGPoint(x: -corona.size.width/2, y: actualY), duration: TimeInterval(actualDuration))
        let actionMoveDone = SKAction.removeFromParent()
        let loseAction = SKAction.run() { [weak self] in
            guard let `self` = self else { return }
            let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
            let gameOverScene = GameOverScene(size: self.size, won: false)
            self.view?.presentScene(gameOverScene, transition: reveal)
        }
        corona.run(SKAction.sequence([actionMove, loseAction, actionMoveDone]))
    }
    
    override public func touchesEnded(_ touches: Set<UITouch>, with event: UIEvent?) {
        // 1 - Choose one of the touches to work with
        guard let touch = touches.first else {
            return
        }
        run(SKAction.playSoundFileNamed("spraysound.m4a", waitForCompletion: false))
        
        let touchLocation = touch.location(in: self)
        
        // 2 - Set up initial location of projectile
        let projectile = SKSpriteNode(texture: SKTexture(image :#imageLiteral(resourceName: "projectile.png")))
        projectile.position = player.position
        
        projectile.physicsBody = SKPhysicsBody(circleOfRadius: projectile.size.width/2)
        projectile.physicsBody?.isDynamic = true
        projectile.physicsBody?.categoryBitMask = PhysicsCategory.projectile
        projectile.physicsBody?.contactTestBitMask = PhysicsCategory.corona
        projectile.physicsBody?.collisionBitMask = PhysicsCategory.none
        projectile.physicsBody?.usesPreciseCollisionDetection = true
        
        // 3 - Determine offset of location to projectile
        let offset = touchLocation - projectile.position
        
        // 4 - Bail out if you are shooting down or backwards
        if offset.x < 0 { return }
        
        // 5 - OK to add now - you've double checked position
        addChild(projectile)
        
        // 6 - Get the direction of where to shoot
        let direction = offset.normalized()
        
        // 7 - Make it shoot far enough to be guaranteed off screen
        let shootAmount = direction * 1000
        
        // 8 - Add the shoot amount to the current position
        let realDest = shootAmount + projectile.position
        
        // 9 - Create the actions
        let actionMove = SKAction.move(to: realDest, duration: 2.0)
        let actionMoveDone = SKAction.removeFromParent()
        projectile.run(SKAction.sequence([actionMove, actionMoveDone]))
    }
    
    func projectileDidCollideWithCorona(projectile: SKSpriteNode, corona: SKSpriteNode) {
        print("Hit")
        projectile.removeFromParent()
        corona.removeFromParent()
        
        coronaDestroyed += 1
        if coronaDestroyed > 30 {
            let reveal = SKTransition.flipHorizontal(withDuration: 0.5)
            let gameOverScene = GameOverScene(size: self.size, won: true)
            view?.presentScene(gameOverScene, transition: reveal)
        }
    }
}

extension GameScene: SKPhysicsContactDelegate {
    public func didBegin(_ contact: SKPhysicsContact) {
        // 1
        var firstBody: SKPhysicsBody
        var secondBody: SKPhysicsBody
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask {
            firstBody = contact.bodyA
            secondBody = contact.bodyB
        } else {
            firstBody = contact.bodyB
            secondBody = contact.bodyA
        }
        
        // 2
        if ((firstBody.categoryBitMask & PhysicsCategory.corona != 0) &&
            (secondBody.categoryBitMask & PhysicsCategory.projectile != 0)) {
            if let corona = firstBody.node as? SKSpriteNode,
                let projectile = secondBody.node as? SKSpriteNode {
                projectileDidCollideWithCorona(projectile: projectile, corona: corona)
            }
        }
    }
}
