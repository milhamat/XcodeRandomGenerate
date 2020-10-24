import SpriteKit
import GameplayKit

var gameScore = 0

public class GameScene: SKScene, SKPhysicsContactDelegate {//panambahan SKPhysicsContactDelegate
    
    
    let scoreLabel = SKLabelNode(fontNamed: "Baloo2-Bold")
    
    var livesNumber = 3
    let livesLabel = SKLabelNode(fontNamed: "Baloo2-Bold")
    
    var levelNumber = 0
    
    let player = SKSpriteNode(imageNamed: "RocketX")
    
    let bulletSound = SKAction.playSoundFileNamed("Lasser1.m4a", waitForCompletion: false) // summoning sound in simple or short time
    let explosionSound = SKAction.playSoundFileNamed("Boom1.m4a", waitForCompletion: false)
    
    let tapToStartLabel = SKLabelNode(fontNamed: "Baloo2-Bold")
//------------------------------------------------------------------------------------------------
    public enum gameState{
        case preGame   // when the game state is before the start of the game
        case inGame    // when the game state is during the game
        case afterGame // when the game state is after the game
    }
    
    var currentGameState = gameState.preGame//inGame // before make a tap to start
    //------------------------------------------------------------------------------------------------
    public struct PhysicsCategories{//dibuat saat game memiliki kontak satu sama lain
        static let None : UInt32 = 0
        static let Player : UInt32 = 0b1//1
        static let Bullet : UInt32 = 0b10//2
        static let Enemy : UInt32 = 0b100//4 kenapa ngga digunakan 3 karna akan memanggil Player dan Bullet
    }
    //------------------------------------------------------------------------------------------------
    public func random() -> CGFloat {
        return CGFloat(Float(arc4random()) / 4294967296) //4294967296 0xFFFFFFFF
    }
    public func random(min: CGFloat, max: CGFloat) -> CGFloat {
        return random() * (max - min) + min
    }
    //------------------------------------------------------------------------------------------------
    var gameArea: CGRect
    
    public override init(size: CGSize){
      
        let maxAspectRatio: CGFloat = 16.0/9.0    //before 16.0/9.0
        let playableWidth = size.height / maxAspectRatio
        let margin = (size.width - playableWidth) / 2
        gameArea = CGRect(x: margin, y: 0, width: playableWidth, height: size.height)
        
        super.init(size: size)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
//------------------------------------------------------------------------------------------------
    public override func didMove(to view: SKView){
        
        gameScore = 0
        
        self.physicsWorld.contactDelegate = self  //asasasasasasasasasa
        
        for i in 0...1{ //for background moving effect
            let background = SKSpriteNode(imageNamed: "space_background")
            background.size = self.size
            background.anchorPoint = CGPoint(x: 0.5, y: 0)//for effect
            background.position = CGPoint(x: self.size.width/2, y: self.size.height * CGFloat(i))// /2) its also new
            background.zPosition = 0
            background.name = "Background"//deklarasi global 2 kali biar bisa di panggil oleh fungsi lain
            self.addChild(background)
        }
        
        
        //------------------------------------------------------------------------------------------------
        //player.setScale(2)//ukuran scala
        player.position = CGPoint(x: self.size.width / 2, y: 0 - player.size.height)//y: self.size.height * 0.2)
        player.zPosition = 2
        player.physicsBody = SKPhysicsBody(rectangleOf: player.size)//
        player.physicsBody!.affectedByGravity = false//bisa kena gravity kebawah kalau true
        player.physicsBody!.categoryBitMask = PhysicsCategories.Player
        player.physicsBody!.collisionBitMask = PhysicsCategories.None
        player.physicsBody!.contactTestBitMask = PhysicsCategories.Enemy
        self.addChild(player)
        //------------------------------------------------------------------------------------------------
        scoreLabel.text = "Score: 0"
        scoreLabel.fontSize = 12
        scoreLabel.fontColor = SKColor.yellow
        scoreLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.left
        scoreLabel.position = CGPoint(x: self.size.width * 0.2, y: self.size.height + scoreLabel.frame.size.height)// * 0.9) efek bounci kebawah x: self.size.width * 0.15
        scoreLabel.zPosition = 100
        self.addChild(scoreLabel)
        //------------------------------------------------------------------------------------------------
        livesLabel.text = "Lives: 3"
        livesLabel.fontSize = 12
        livesLabel.fontColor = SKColor.yellow
        livesLabel.horizontalAlignmentMode = SKLabelHorizontalAlignmentMode.right
        livesLabel.position = CGPoint(x: self.size.width * 0.80, y: self.size.height + livesLabel.frame.size.height)// * 0.9) efek bounci kebawah x: self.size.width * 0.85
        livesLabel.zPosition = 100
        self.addChild(livesLabel)
        //efek turun kebawah saat di tab to begin
        let moveOnToScreenAction = SKAction.moveTo(y: self.size.height * 0.9, duration: 0.3)
        scoreLabel.run(moveOnToScreenAction)
        livesLabel.run(moveOnToScreenAction)
        //------------------------------------------------------------------------------------------------
        tapToStartLabel.text = "Tap To Begin"
        tapToStartLabel.fontSize = 15
        tapToStartLabel.fontColor = SKColor.yellow
        tapToStartLabel.zPosition = 1
        tapToStartLabel.position = CGPoint(x: self.size.width/2, y: self.size.height/2)
        tapToStartLabel.alpha = 0 //invinsible semakin besar semakin kelihatan tranparansi
        self.addChild(tapToStartLabel)
        
        let fadeInAction = SKAction.fadeIn(withDuration: 0.3)
        tapToStartLabel.run(fadeInAction)
        
        //startNewLevel() //otomatis langsung mulau
    }
    
 //------------------------------------------------------------------------------------------------
    var lastUpdateTime: TimeInterval = 0
    var deltaFrameTime: TimeInterval = 0
    var amountToMovePerSecond: CGFloat = 600.0 //speed of background move
    //its need for moving background
    public override func update(_ currentTime: TimeInterval) {
        
        if lastUpdateTime == 0{
            lastUpdateTime = currentTime
        }
        else {
            deltaFrameTime = currentTime - lastUpdateTime
            lastUpdateTime = currentTime
        }
        
        let amountToMoveBackground = amountToMovePerSecond * CGFloat(deltaFrameTime)
        // cara memanggil nama ini sial background
        self.enumerateChildNodes(withName: "Background"){
            background, stop in
            
            if self.currentGameState == gameState.inGame{ //harus pakai self agar bisa meenemukan
            background.position.y -= amountToMoveBackground
            }
            
            if background.position.y < -self.size.height{
                background.position.y += self.size.height*2
            }
        }
    }
//------------------------------------------------------------------------------------------------
    public func startGame(){
        
        currentGameState = gameState.inGame
        
        let fadeOutAction = SKAction.fadeOut(withDuration: 0.5)
        let deleteAction = SKAction.removeFromParent()
        let deleteSequence = SKAction.sequence([fadeOutAction,deleteAction])
        tapToStartLabel.run(deleteSequence)
        
        let moveShipOntoScreenAction = SKAction.moveTo(y: self.size.height * 0.2, duration: 0.5)
        let startLevelAction = SKAction.run(startNewLevel)
        let startGameSequence = SKAction.sequence([moveShipOntoScreenAction,startLevelAction])
        player.run(startGameSequence)
        
        
    }
//------------------------------------------------------------------------------------------------
    public func loseAlife(){
        
        livesNumber -= 1
        livesLabel.text = "Lives: \(livesNumber)"
        
        let scaleUp = SKAction.scale(to: 1.5, duration: 0.2)
        let scaleDown = SKAction.scale(to: 1, duration: 0.2)
        let scaleSequence = SKAction.sequence([scaleUp, scaleDown])
        livesLabel.run(scaleSequence)
        
        if livesNumber == 0 {
            runGameOver()
        }
    }
//------------------------------------------------------------------------------------------------
   public func addScore(){
        
        gameScore += 1
        scoreLabel.text = "Score: \(gameScore)"
        
        if gameScore == 10 || gameScore == 25 || gameScore == 50{
            startNewLevel()
        }
    }
//------------------------------------------------------------------------------------------------
   public func runGameOver(){
        
        currentGameState = gameState.afterGame // bisa juga menulis hanya currentGameState = .afterGame
        
        self.removeAllActions()
        
        self.enumerateChildNodes(withName: "Bullet"){//refrens name cus its dont use global declare and use reference name inisial
            bullet, stop in
            bullet.removeAllActions()
        }
        
        self.enumerateChildNodes(withName: "Enemy"){
            enemy, stop in
            enemy.removeAllActions()
        }
        
        let changeSceneAction = SKAction.run(changeScene)
        let waitToChangeScene = SKAction.wait(forDuration: 1)
        let changeSceneSequence = SKAction.sequence([changeSceneAction,waitToChangeScene])
        self.run(changeSceneSequence)
    }
//------------------------------------------------------------------------------------------------
     public func changeScene(){
        
        let sceneToMoveTo = GameOverScene(size: self.size)
        sceneToMoveTo.scaleMode = self.scaleMode
        let myTransition = SKTransition.fade(withDuration: 0.5)
        self.view!.presentScene(sceneToMoveTo, transition: myTransition)
    }
    //--------------------------------------------------------------------------------------------
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
        
        if body1.categoryBitMask == PhysicsCategories.Bullet && body2.categoryBitMask == PhysicsCategories.Enemy && (body2.node?.position.y)!  < self.size.height{
            //if the Bullet has hit the Enemy
            addScore()
            
            if body2.node != nil{
            spawnExplosion(spawnPosition: body2.node!.position)
            }
            body1.node?.removeFromParent()
            body2.node?.removeFromParent()
        }
        
    }
//------------------------------------------------------------------------------------------------
   public func spawnExplosion(spawnPosition: CGPoint){
        
        let explosion = SKSpriteNode(imageNamed: "Kboom")
        explosion.position = spawnPosition
        explosion.zPosition = 3
        explosion.setScale(0)
        self.addChild(explosion)
        
        let scaleIn = SKAction.scale(to: 1, duration: 0.1)
        let fadeOut = SKAction.fadeOut(withDuration: 0.1)
        let delete = SKAction.removeFromParent()
        
        let explosionSequence = SKAction.sequence([explosionSound,scaleIn,fadeOut,delete])
        
        explosion.run(explosionSequence)
    }
//------------------------------------------------------------------------------------------------
    public func startNewLevel(){
        
        levelNumber += 1
        
        if self.action(forKey: "spawningEnemies") != nil{
            self.removeAction(forKey: "spawningEnemies")
        }
        
        var levelDuration = TimeInterval()
        
        switch levelNumber {
        case 1: levelDuration = 2
        case 2: levelDuration = 1.5
        case 3: levelDuration = 1
        case 4: levelDuration = 0.8
        default:
            levelDuration = 0.5
            print("cannot find level info")
        }
        
        let spawn = SKAction.run(spawnEnemy)
        let waitToSpawn = SKAction.wait(forDuration: levelDuration)
        let spawnSequence = SKAction.sequence([waitToSpawn,spawn])
        let spawnForever = SKAction.repeatForever(spawnSequence)
        self.run(spawnForever, withKey: "spawningEnemies")
    }
//------------------------------------------------------------------------------------------------
    public func fireBullet(){
        let bullet = SKSpriteNode(imageNamed: "Blast3")
        bullet.name = "Bullet"
        //bullet.setScale(1)//besar scala
        bullet.position = player.position
        bullet.zPosition = 1
        bullet.physicsBody = SKPhysicsBody(rectangleOf: bullet.size)//
        bullet.physicsBody!.affectedByGravity = false//bisa kena gravity kebawah kalau true
        bullet.physicsBody!.categoryBitMask = PhysicsCategories.Bullet
        bullet.physicsBody!.collisionBitMask = PhysicsCategories.None
        bullet.physicsBody!.contactTestBitMask = PhysicsCategories.Enemy
        self.addChild(bullet)
        
        let moveBullet = SKAction.moveTo(y: self.size.height + bullet.size.height, duration: 1)
        let deletBullet = SKAction.removeFromParent()
        let bulletSequence = SKAction.sequence([bulletSound, moveBullet, deletBullet])
        bullet.run(bulletSequence)
    }
//------------------------------------------------------------------------------------------------
   public func spawnEnemy(){
        
        let randomXStart = random(min: gameArea.minX, max: gameArea.maxX)
        let randomXEnd = random(min: gameArea.minX, max: gameArea.maxX)
        
        let startPoint = CGPoint(x: randomXStart, y: self.size.height * 1.2) //CGPoint(x: randomXStart, y: self.size.height * 1.2)
        let endPoint = CGPoint(x: randomXEnd, y: -self.size.height * 0.2) //CGPoint(x: randomXEnd, y: -self.size.height * 0.2)
        
        let enemy = SKSpriteNode(imageNamed: "Monster1")
        enemy.name = "Enemy"
        //enemy.setScale(2)//besar scala
        enemy.position = startPoint
        enemy.zPosition = 2
        enemy.physicsBody = SKPhysicsBody(rectangleOf: enemy.size)//
        enemy.physicsBody!.affectedByGravity = false//bisa kena gravity kebawah kalau true
        enemy.physicsBody!.categoryBitMask = PhysicsCategories.Enemy
        enemy.physicsBody!.collisionBitMask = PhysicsCategories.None
        enemy.physicsBody!.contactTestBitMask = PhysicsCategories.Player | PhysicsCategories.Bullet
        self.addChild(enemy)
        //-----------Move--Enemy--To--The--Bottom------------
        let moveEnemy = SKAction.move(to: endPoint, duration: 1.8)//1.5
        let deleteEnemy = SKAction.removeFromParent()
        
        let loseALifeAction = SKAction.run(loseAlife)//mengurangi nyawa saat Enemy lewat batas
        
        let enemySequence = SKAction.sequence([moveEnemy, deleteEnemy, loseALifeAction])
        
        if currentGameState == gameState.inGame{
        enemy.run(enemySequence)
        }
        //----------------------------------------------------
        /*
         let dx = endPoint.x - startPoint.x
         let dy = endPoint.y - startPoint.y
         let amountToRotate = atan2(dy, dx)
         enemy.zRotation = amountToRotate
         */
        
    }
//------------------------------------------------------------------------------------------------
    public override func touchesBegan(_ touches: Set<UITouch>, with event: UIEvent?) {
        
        if currentGameState == gameState.preGame{
            startGame()
        }
        
        else if currentGameState == gameState.inGame{
        fireBullet()
        }
        //spawnEnemy() saat ditekan akan memanggil pesawat musuh
    }
//------------------------------------------------------------------------------------------------
    public override func touchesMoved(_ touches: Set<UITouch>, with event: UIEvent?) {
        for touch: AnyObject in touches{
            let pointOfTouch = touch.location(in: self)
            let previousPointOfTouch = touch.previousLocation(in: self)
            
            let amountDragged = pointOfTouch.x - previousPointOfTouch.x
            
            if currentGameState == gameState.inGame{
            player.position.x += amountDragged
            }
            
            if player.position.x > gameArea.maxX - player.size.width/2{
                player.position.x = gameArea.maxX - player.size.width/2
            }
            if player.position.x < gameArea.minX + player.size.width/2{
                player.position.x = gameArea.minX + player.size.width/2
                
            }
        }
    }
}
