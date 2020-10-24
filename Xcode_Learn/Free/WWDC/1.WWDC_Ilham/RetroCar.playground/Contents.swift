import PlaygroundSupport
import SpriteKit
import Foundation

let sceneView = SKView(frame: CGRect(x: 0, y: 0, width: 320, height: 480))
let scene = FirstScreen(size: CGSize(width: 320, height: 480))
scene.scaleMode = .aspectFill
sceneView.preferredFramesPerSecond = 60
sceneView.presentScene(scene)

PlaygroundPage.current.liveView = sceneView

