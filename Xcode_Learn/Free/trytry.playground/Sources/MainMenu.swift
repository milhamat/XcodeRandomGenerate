import Foundation
import SpriteKit

public class MainMenuScene: SKScene {
    
//------------------------------------------------------------------------------------------------
    public override func didMove(to view: SKView) {
        
        let background = SKSpriteNode(imageNamed: "space_background")
        background.size = self.size
        background.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        background.zPosition = 0
        self.addChild(background)
        
        let gameBy = SKLabelNode(fontNamed: "Baloo2-Bold")
        gameBy.text = "M Ilham A T"
        gameBy.fontSize = 24
        gameBy.fontColor = SKColor.yellow
        gameBy.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.78)
        gameBy.zPosition = 1
        self.addChild(gameBy)
        
        let gameName1 = SKLabelNode(fontNamed: "Baloo2-Bold")
        gameName1.text = "Suicide"
        gameName1.fontSize = 22
        gameName1.fontColor = SKColor.yellow
        gameName1.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.7)
        gameName1.zPosition = 1
        self.addChild(gameName1)
        
        let gameName2 = SKLabelNode(fontNamed: "Baloo2-Bold")
        gameName2.text = "Mission"
        gameName2.fontSize = 22
        gameName2.fontColor = SKColor.yellow
        gameName2.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.625)
        gameName2.zPosition = 1
        self.addChild(gameName2)
        
        let startGame = SKLabelNode(fontNamed: "Baloo2-Bold")
        startGame.text = "Start Game"
        startGame.fontSize = 15
        startGame.fontColor = SKColor.yellow
        startGame.position = CGPoint(x: self.size.width * 0.5, y: self.size.height * 0.4)
        startGame.zPosition = 1
        startGame.name = "startButton"
        self.addChild(startGame)
    }
//------------------------------------------------------------------------------------------------
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        for touch: AnyObject in touches{
        
            let pointOfTouch = touch.location(in: self)
            let nodeITapped = atPoint(pointOfTouch)
            
            if nodeITapped.name == "startButton" {
                
                let sceneToMoveTo = GameScene(size: self.size)
                sceneToMoveTo.scaleMode = self.scaleMode
                let myTransition = SKTransition.fade(withDuration: 0.5)
                self.view!.presentScene(sceneToMoveTo, transition: myTransition)
            }
        
    }
}
}
