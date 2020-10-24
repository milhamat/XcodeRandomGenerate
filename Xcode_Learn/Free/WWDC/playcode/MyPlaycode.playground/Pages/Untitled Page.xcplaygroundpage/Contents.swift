import SpriteKit
import AVFoundation

var audioPlayer: AVAudioPlayer!

let soundURL = Bundle.main.url(forResource: "Wrongsnd", withExtension: "m4a")

do {
    audioPlayer = try AVAudioPlayer(contentsOf: soundURL!)
} catch {
    print(error)
}

audioPlayer.play()
