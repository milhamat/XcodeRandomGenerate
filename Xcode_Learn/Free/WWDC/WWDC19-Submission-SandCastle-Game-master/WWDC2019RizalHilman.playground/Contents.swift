//: A UIKit based Playground for presenting user interface
  
import UIKit
import PlaygroundSupport
import AVFoundation


class MyViewController: UIViewController {
    
    var mainBG: UIImageView!
    var buttonPlay: UIButton!
    var npcCrabs = [UIImageView]()
    
    var soundURI: URL?
    var audioPlayer = AVAudioPlayer()
    var bgSoundURI: URL?
    var bgAudioPlayer = AVAudioPlayer()
    
    override func loadView() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 581, height: 640))
        self.view = view
        navigationController?.isNavigationBarHidden = true
        
        // MARK: Setup View
        // Main Background
        mainBG = UIImageView(frame: CGRect(x: 0, y: 0, width: 581, height: 640))
        mainBG.image = UIImage(named: "HomeMainBG")
        mainBG.contentMode = .scaleAspectFit
        view.addSubview(mainBG)
        
        // Button Play
        buttonPlay = UIButton(frame: CGRect(x: 0, y: 0, width: 150, height: 150))
        buttonPlay.setImage(UIImage(named: "ButtonPlay"), for: .normal)
        buttonPlay?.center = mainBG.center
        buttonPlay.frame.origin.y += 50
        view.addSubview(buttonPlay)
        
        // Crabs NPC
        for i in 1...3 {
            // Make random x, y position
            let x_pos = Int.random(in: 10...500) / i
            let y_pos = (i + Int.random(in: 20...50)) + Int.random(in: 480...520)
            let crab = UIImageView(frame: CGRect(x: x_pos, y: y_pos, width: 100, height: 100))
            crab.image = UIImage(named: "NPCCrab")
            crab.contentMode = .scaleAspectFit
            npcCrabs.append(crab)
            view.addSubview(crab)
        }
        
        // MARK: Setup Game Soundtrack
        self.playBackSound(file: "BacksoundMainBG", fileExtension: "wav")
        
        // MARK: Setup Animation
        UIView.animateKeyframes(withDuration: 0.5, delay: 0, options: [.calculationModeCubic, .autoreverse, .repeat, .allowUserInteraction], animations: {
            UIView.addKeyframe(withRelativeStartTime: 0.0, relativeDuration: 1.0, animations: {
                self.buttonPlay.transform = CGAffineTransform(scaleX: 1.2, y: 1.2)
            })
        })
        
        // MARK: Setup Event
        buttonPlay.addTarget(self, action: #selector(buttonPlayTapped(_:)), for: .touchUpInside)
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
    
    public func playBackSound(file: String, fileExtension: String){
        bgSoundURI = URL(fileURLWithPath: Bundle.main.path(forResource: file, ofType: fileExtension)!)
        do {
            guard let uri = bgSoundURI else {return}
            bgAudioPlayer = try AVAudioPlayer(contentsOf: uri)
            bgAudioPlayer.numberOfLoops = -1
            bgAudioPlayer.play()
        } catch {
            // couldn't load file :(
        }
    }

    @objc func buttonPlayTapped(_ sender: UIButton){
        playTouchSound()
        //print("Let's Play The Game!")
        let vc = Tutorial()
        navigationController?.pushViewController(vc, animated: true)
    }
}

// Present the view controller in the Live View window
let viewController = MyViewController()
viewController.preferredContentSize = CGSize(width: 581, height: 640)
PlaygroundPage.current.needsIndefiniteExecution = true
PlaygroundPage.current.liveView = UINavigationController(rootViewController: viewController)
