import AVFoundation

//
//  WWDC19 - Sand Castle Game
//
//  Created by Maulana Rizal Hilman on 21/03/19.
//  Copyright © 2019 Maulana Rizal Hilman. All rights reserved.
//

public class Helpers {
    
    let pianoSound = URL(fileURLWithPath: Bundle.main.path(forResource: "touch_sound", ofType: "mp3")!)
    var audioPlayer = AVAudioPlayer()
    var player = AVAudioPlayer()
    
    public func playSound(){
        do {
            audioPlayer = try AVAudioPlayer(contentsOf: pianoSound)
            audioPlayer.play()
        } catch {
            // couldn't load file :(
        }
    }
    
    
    public func playBackSound(file: String, fileExtension: String, isLoop: Bool = false){
        guard let url = Bundle.main.url(forResource: file, withExtension: fileExtension) else { return }
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            player = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            if isLoop {
                player.numberOfLoops = -1
            }
            player.play()
        } catch let error {
            print(error.localizedDescription)
        }
    }
}
