import Foundation
import SpriteKit

public class GameOverScene: SKScene{
    
     let restartLabel = SKLabelNode(fontNamed: "Baloo2-Bold")
//------------------------------------------------------------------------------------------------
    public override func didMove(to view: SKView) {
        
        let background = SKSpriteNode(imageNamed: "space_background")
        background.size = self.size// dont forget it. if you will get a shrinking background
        background.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        background.zPosition = 0
        self.addChild(background)
        //------------------------------------------------------------------------------------------------
        let gameOverLabel = SKLabelNode(fontNamed: "Baloo2-Bold")
        gameOverLabel.text = "Game Over"
        gameOverLabel.fontSize = 18 //200
        gameOverLabel.fontColor = SKColor.yellow
        gameOverLabel.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.7)
        gameOverLabel.zPosition = 1
        self.addChild(gameOverLabel)
        //------------------------------------------------------------------------------------------------
        let scoreLabel = SKLabelNode(fontNamed: "Baloo2-Bold")
        scoreLabel.text = "Score: \(gameScore)"
        scoreLabel.fontSize = 12
        scoreLabel.fontColor = SKColor.yellow
        scoreLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.55)
        scoreLabel.zPosition = 1
        self.addChild(scoreLabel)
        //------------------------------------------------------------------------------------------------
        let defaults = UserDefaults()
        var highScoreNumber = defaults.integer(forKey: "highScoreSeved")
        
        if gameScore > highScoreNumber{
            highScoreNumber = gameScore
            defaults.set(highScoreNumber, forKey: "highScoreSeved")
        }
        
        let highScoreLabel = SKLabelNode(fontNamed: "Baloo2-Bold")
        highScoreLabel.text = "High Score: \(highScoreNumber)"
        highScoreLabel.fontSize = 12
        highScoreLabel.fontColor = SKColor.yellow
        highScoreLabel.zPosition = 1
        highScoreLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.45)
        self.addChild(highScoreLabel)
        //------------------------------------------------------------------------------------------------
       //restartLabel dengan deklarasi global
        restartLabel.text = "Restart"
        restartLabel.fontSize = 9
        restartLabel.fontColor = SKColor.yellow
        restartLabel.zPosition = 1
        restartLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.3)
        self.addChild(restartLabel)
    }
//------------------------------------------------------------------------------------------------
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches{
            let pointOfTouch = touch.location(in: self)
            if restartLabel.contains(pointOfTouch){
                
                let sceneToMoveTo = GameScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
                
            }
        }
    }
    
}
