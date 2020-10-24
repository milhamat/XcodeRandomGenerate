import Foundation
import SpriteKit

public class GameOverScene: SKScene {
    let gameOverLabel = SKLabelNode(fontNamed: "Arial.ttf")
    let background = SKSpriteNode(imageNamed: "Rectangle.png")
    let scoreLabel = SKLabelNode(fontNamed: "Arial.ttf")
    let highScoreLabel = SKLabelNode(fontNamed:"Arial.ttf")
    let restartLabel = SKLabelNode(fontNamed: "Arial.ttf")
    //------------------------------------------------------------------------------------------------
    public override func didMove(to view: SKView){
        
        background.setScale(5)
        addChild(background)
        
        gameOverLabel.text = "Game Over"
        gameOverLabel.fontSize = 42
        gameOverLabel.fontColor = SKColor.black
        gameOverLabel.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.7)
        gameOverLabel.zPosition = 1
        self.addChild(gameOverLabel)
        
        //------------------------------------------------------------------------------------------------
        scoreLabel.text = "Score: \(gameScore)"
        scoreLabel.fontSize = 32
        scoreLabel.fontColor = SKColor.black
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
        
        highScoreLabel.text = "High Score: \(highScoreNumber)"
        highScoreLabel.fontSize = 32
        highScoreLabel.fontColor = SKColor.black
        highScoreLabel.zPosition = 1
        highScoreLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.45)
        self.addChild(highScoreLabel)
        //------------------------------------------------------------------------------------------------
        restartLabel.text = "Restart"
        restartLabel.fontSize = 30
        restartLabel.fontColor = SKColor.white
        restartLabel.zPosition = 1
        restartLabel.position = CGPoint(x: self.size.width/2, y: self.size.height*0.3)
        self.addChild(restartLabel)
    }
    
//------------------------------------------------------------------------------------------------
public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
    for touch: AnyObject in touches{
        let pointOfTouch = touch.location(in: self)
        if restartLabel.contains(pointOfTouch){
            
            let sceneToMoveTo = FirstScreen(size: self.size)
            sceneToMoveTo.scaleMode = self.scaleMode
            let myTransition = SKTransition.fade(withDuration: 0.5)
            self.view!.presentScene(sceneToMoveTo, transition: myTransition)
            
        }
    }
}
}

