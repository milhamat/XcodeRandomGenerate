import UIKit
import AVFoundation

//
//  WWDC19 - Sand Castle Game
//
//  Created by Maulana Rizal Hilman on 21/03/19.
//  Copyright © 2019 Maulana Rizal Hilman. All rights reserved.
//

public class Tutorial: UIViewController {
    
    var tutorialImages = ["Tutor-01", "Tutor-02", "Tutor-03", "Tutor-04"]
    var nextGameLevel = 1
    var currentTutorIndex = 0
    var imageView: UIImageView!
    
    var soundURI: URL?
    var audioPlayer = AVAudioPlayer()
    
    public override func viewDidLoad() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 581, height: 640))
        self.view = view
        
        let image = UIImage(named: tutorialImages[0])
        imageView = UIImageView(frame: CGRect(x: 0, y: 0, width: 581, height: 640))
        imageView.isUserInteractionEnabled = true
        imageView.image = image
        imageView.contentMode = .scaleAspectFit
        view.addSubview(imageView)
        
        let tap = UITapGestureRecognizer(target: self, action: #selector(nextImage(_:)))
        imageView.addGestureRecognizer(tap)
    }
    public func playSound(file: String, fileExtension: String, isLoop: Bool = false){
        soundURI = URL(fileURLWithPath: Bundle.main.path(forResource: file, ofType: fileExtension)!)
        do {
            guard let uri = soundURI else {return}
            audioPlayer = try AVAudioPlayer(contentsOf: uri)
            audioPlayer.play()
        } catch {
            // couldn't load file :(
        }
    }
    public func playTouchSound(){
        self.playSound(file: "touch_sound", fileExtension: "mp3")
    }
    @objc public func nextImage(_ sender: UIPinchGestureRecognizer){
        playTouchSound()
        
        currentTutorIndex += 1
        
        if currentTutorIndex < tutorialImages.count {
            imageView.image = UIImage(named: tutorialImages[currentTutorIndex])
        } else {
            let vc = GamePlay()
            
            switch nextGameLevel {
                case 2:
                    vc.castleItems = ["SecondLevel-Castlepart-01",
                                      "SecondLevel-Castlepart-02",
                                      "SecondLevel-Castlepart-03",
                                      "SecondLevel-Castlepart-04",
                                      "SecondLevel-Castlepart-05",
                                      "SecondLevel-Castlepart-07",
                                      "SecondLevel-Castlepart-08"
                    ]
                    vc.gameLevel = 2
                    vc.maxTime = 28
                    vc.referenceResult = "ReferenceResult02"
                default:
                    vc.castleItems = ["FirstLevel-Castlepart-09",
                                      "FirstLevel-Castlepart-07",
                                      "FirstLevel-Castlepart-08",
                                      "FirstLevel-Castlepart-11"]
                    vc.gameLevel = 1
                    vc.referenceResult = "ReferenceResult01"
                
            }
            
            navigationController?.pushViewController(vc, animated: true)
        }
    }
}


