import SpriteKit
import GameplayKit

var gameScore = 0

public class FirstScreen: SKScene, SKPhysicsContactDelegate {
    
    var gameArea: CGRect
    let player = SKSpriteNode(imageNamed: "Car")
    let scoreLabel = SKLabelNode(fontNamed: "Arial.ttf")
    let background = SKSpriteNode(imageNamed: "Rectangle.png")
    let tapToBeginLabel = SKLabelNode(fontNamed: "Baloo2-Bold")
    let explosionSound = SKAction.playSoundFileNamed("RetroBoom.m4a", waitForCompletion: false)
    var currentGameState = gameState.preGame
    var levelNumber = 0

    //----------------------------------------------------------------------------
    enum gameState{
        case preGame
        case inGame
        case afterGame
    }
    //----------------------------------------------------------------------------
    public func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 4294967296)
    }
    public func random (min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
    //----------------------------------------------------------------------------
    public struct PhysicsCategories{
    static let None : UInt32 = 0
    static let Player : UInt32 = 0b1
    static let Enemy : UInt32 = 0b100
    }
    //----------------------------------------------------------------------------
    public override init(size: CGSize){
      
        let maxAspectRatio: CGFloat = 19.5/9.0
        let playableWidth = size.height / maxAspectRatio
        let margin = (size.width - playableWidth) / 2
        gameArea = CGRect(x: margin, y: 0, width: playableWidth, height: size.height)
        
        super.init(size: size)
    }
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
    //----------------------------------------------------------------------------
    public override func didMove(to view: SKView){
        gameScore = 0
        
        self.physicsWorld.contactDelegate = self
        
        background.setScale(5)
        addChild(background)
        
        player.position = CGPoint(x: self.size.width / 2, y: size.height * 0.1)
        player.zPosition = 2
        player.physicsBody = SKPhysicsBody(rectangleOf: player.size)
        player.physicsBody!.affectedByGravity = false
        player.physicsBody!.categoryBitMask = PhysicsCategories.Player
        player.physicsBody!.collisionBitMask = PhysicsCategories.None
        player.physicsBody!.contactTestBitMask = PhysicsCategories.Enemy
        self.addChild(player)
        
        scoreLabel.text = "Score: 0"
        scoreLabel.fontSize = 24
        scoreLabel.fontColor = SKColor.black
        scoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        scoreLabel.position = CGPoint(x: self.size.width * 0.2, y: self.size.height * 0.9)
        scoreLabel.zPosition = 100
        addChild(scoreLabel)
        
        tapToBeginLabel.text = "Tab To Start"
        tapToBeginLabel.fontSize = 32
        tapToBeginLabel.fontColor = SKColor.white
        tapToBeginLabel.zPosition = 1
        tapToBeginLabel.position = CGPoint(x: self.size.width / 2, y: self.size.height / 2)
        tapToBeginLabel.alpha = 0
        self.addChild(tapToBeginLabel)
        
        let fadeInAction = SKAction.fadeIn(withDuration: 0.3)
        tapToBeginLabel.run(fadeInAction)
        
    }
    //----------------------------------------------------------------------------
    public func startGame(){
        
        currentGameState = gameState.inGame
        
        let fadeOutAction = SKAction.fadeOut(withDuration: 0.5)
        let deleteAction = SKAction.removeFromParent()
        let deleteSequence = SKAction.sequence([fadeOutAction,deleteAction])
        tapToBeginLabel.run(deleteSequence)
        
        let moveCarOntoScreenAction = SKAction.moveTo(y: self.size.height * 0.2, duration: 0.5)
        let startLevelAction = SKAction.run(startLevel)
        let startGameSequence = SKAction.sequence([moveCarOntoScreenAction,startLevelAction])
        player.run(startGameSequence)
    }
    //----------------------------------------------------------------------------
    public func didBegin(_ contact: SKPhysicsContact) {
        var body1 = SKPhysicsBody()
        var body2 = SKPhysicsBody()
        
        if contact.bodyA.categoryBitMask < contact.bodyB.categoryBitMask{
            body1 = contact.bodyA
            body2 = contact.bodyB
        }else{
            body1 = contact.bodyB
            body2 = contact.bodyA
        }
        
        if body1.categoryBitMask == PhysicsCategories.Player && body2.categoryBitMask == PhysicsCategories.Enemy{
            //if the Player has hit the Enemy
            if body1.node != nil {
            spawnExplosion(spawnPosition: body1.node!.position)
            }
            if body2.node != nil {
            spawnExplosion(spawnPosition: body2.node!.position)
            }
            body1.node?.removeFromParent()
            body2.node?.removeFromParent()
            
            runGameOver()
        }
    }
    //----------------------------------------------------------------------------
    public func addScore(){
        gameScore += 1
    
        scoreLabel.text = "Score: \(gameScore)"
        print(gameScore)
        
        if gameScore == 50 || gameScore == 100 || gameScore == 150{
            startLevel()
        }
    }
    //----------------------------------------------------------------------------
    public func runGameOver(){
        
        currentGameState = gameState.afterGame
        
        self.removeAllActions()
        
        self.enumerateChildNodes(withName: "Enemy"){
            enemy, stop in
            enemy.removeAllActions()
        }
        let changeSceneAction = SKAction.run(changeScene)
        let waitToChangeScene = SKAction.wait(forDuration: 2)
        let changeSceneSequence = SKAction.sequence([changeSceneAction,waitToChangeScene])
        self.run(changeSceneSequence)
    }
    //----------------------------------------------------------------------------
    public func changeScene(){
        
        let sceneToMoveTo = GameOverScene(size: self.size)
        sceneToMoveTo.scaleMode = self.scaleMode
        let myTransition = SKTransition.fade(withDuration: 1.0)
        self.view!.presentScene(sceneToMoveTo, transition: myTransition)
    }
    //----------------------------------------------------------------------------
    public func spawnExplosion(spawnPosition: CGPoint){
        
        let explosion = SKSpriteNode(imageNamed: "Explode")
        explosion.position = spawnPosition
        explosion.zPosition = 3
        explosion.setScale(0)
        self.addChild(explosion)
        
        let scaleIn = SKAction.scale(to: 1, duration: 0.5)
        let fadeOut = SKAction.fadeOut(withDuration: 0.5)
        let delete = SKAction.removeFromParent()
        
        let explosionSequence = SKAction.sequence([explosionSound,scaleIn,fadeOut,delete])
        
        explosion.run(explosionSequence)
    }
    //----------------------------------------------------------------------------
    public func startLevel(){
        levelNumber += 1
        
        if self.action(forKey: "spawningEnemies") != nil{
            self.removeAction(forKey: "spawningEnemies")
        }
        
        var levelDuration = TimeInterval()
        
        switch levelNumber {
        case 1: levelDuration = 1
        case 2: levelDuration = 0.8
        case 3: levelDuration = 0.6
        case 4: levelDuration = 0.2
        default:
            levelDuration = 0.1
            print("cannot find level info")
        }
        let spawn = SKAction.run(spawnEnemy)
        let waitToSpawn = SKAction.wait(forDuration: 1)
        let spawnSequence = SKAction.sequence([waitToSpawn,spawn])
        let spawnForever = SKAction.repeatForever(spawnSequence)
        self.run(spawnForever, withKey: "spawningEnemies")
    }
    
    //----------------------------------------------------------------------------
    public func spawnEnemy(){
        let randomXStart = random(min: gameArea.minX, max: gameArea.maxX)
        let randomXEnd = random(min: gameArea.minX, max: gameArea.maxX)
        
        let startPoint = CGPoint(x: randomXStart, y: self.size.height * 1.2)
        let endPoint = CGPoint(x: randomXEnd, y: -self.size.height * 0.2)
        
        let enemy = SKSpriteNode(imageNamed: "Car")
        enemy.position = startPoint
        enemy.zPosition = 2
        enemy.name = "Enemy"
        enemy.physicsBody = SKPhysicsBody(rectangleOf: enemy.size)
        enemy.physicsBody!.affectedByGravity = false
        enemy.physicsBody!.categoryBitMask = PhysicsCategories.Enemy
        enemy.physicsBody!.collisionBitMask = PhysicsCategories.None
        enemy.physicsBody!.contactTestBitMask = PhysicsCategories.Player
        self.addChild(enemy)
        
        let moveEnemy = SKAction.move(to: endPoint, duration: 2.0)
        let deleteEnemy = SKAction.removeFromParent()
        let scorePlus = SKAction.run(addScore)
        
        let enemySequence = SKAction.sequence([moveEnemy,deleteEnemy,scorePlus])
        enemy.run(enemySequence)
        
        if currentGameState == gameState.inGame{
        enemy.run(enemySequence)
        }
    }
    
    //----------------------------------------------------------------------------
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if currentGameState == gameState.preGame{
            startGame()
        }
    }
    //----------------------------------------------------------------------------
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches{
        let pointOfTouch = touch.location(in: self)
        let previousPointOfTouch = touch.previousLocation(in: self)
        
        let amountDragged = pointOfTouch.x - previousPointOfTouch.x
        player.position.x += amountDragged
        
        if currentGameState == gameState.inGame{
             player.position.x += amountDragged
        }
            
        if player.position.x > gameArea.maxX - player.size.width/2 {
                player.position.x = gameArea.maxX - player.size.width/2
            }
        if player.position.x < gameArea.minX + player.size.width/2 {
                player.position.x = gameArea.minX + player.size.width/2
                
            }
        }
    }
    
}

