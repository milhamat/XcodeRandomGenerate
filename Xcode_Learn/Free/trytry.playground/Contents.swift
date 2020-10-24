import SpriteKit
import GameplayKit
import AVFoundation
import PlaygroundSupport

public class GameViewController: UIViewController {
    
    var backingAudio = AVAudioPlayer()
//------------------------------------------------------------------------------------------------
    public override func viewDidLoad() {
        super.viewDidLoad()
        
        let sound = Bundle.main.path(forResource: "BackingSongSG", ofType: "mp3")
        do {
            backingAudio = try AVAudioPlayer(contentsOf: URL(fileURLWithPath: sound!))
            
        }
        catch {
            print("Cannot Find the Audio")
            
        }
        
        backingAudio.numberOfLoops = -1 //1 or 2 or if wanna for ever -1
        backingAudio.play()
        
        /*let scene = MainMenuScene(size: CGSize(width: 640, height: 480))
        let skView = self.view as! SKView
        skView.showsFPS = true //false
        skView.showsNodeCount = true //false
        
        skView.ignoresSiblingOrder = true
        
        scene.scaleMode = .aspectFill
        skView.presentScene(scene)*/
    }
}
//------------------------------------------------------------------------------------------------
let sceneView = SKView(frame: CGRect(x:0, y:0, width: 640, height: 480))
let scene = MainMenuScene(size: CGSize(width: 640, height: 480))
scene.scaleMode = .aspectFill
sceneView.presentScene(scene)

PlaygroundSupport.PlaygroundPage.current.liveView = sceneView

