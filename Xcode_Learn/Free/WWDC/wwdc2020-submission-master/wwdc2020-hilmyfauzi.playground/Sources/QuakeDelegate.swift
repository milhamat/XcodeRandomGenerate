import Foundation
import UIKit
import AVFoundation

protocol QuakeView {
    var nextButton: MainButton {get set}
    var descText: UILabel {get set}
    var imgBg: UIImageView {get set}
    var imgIcon: UIImageView {get set}
    
    func setupUI(at view: UIView, isInside: Bool)
}

public class QuakeDelegate: QuakeView {
    public var nextButton: MainButton
    public var descText: UILabel
    public var imgBg: UIImageView
    public var imgIcon: UIImageView
    
    public var playerBtnPressed: AVAudioPlayer?
    public var playerBackSound = AVAudioPlayer()
    
    public var count = 0
    
    public init() {
        nextButton = MainButton()
        descText = UILabel()
        imgBg = UIImageView()
        imgIcon = UIImageView()
    }
    
    public func setupUI(at view: UIView, isInside: Bool) {
        setupContentMain(isInside)
        setupNextButton()
        setupImgBg(isInside)
        
        let sfxName = isInside ? "eq-inside-sfx" : "eq-outside-sfx"
        playBackSound(sfxName)
        
        view.addSubview(descText)
        view.addSubview(nextButton)
        view.addSubview(imgIcon)
        view.insertSubview(imgBg, at: 0)
        
    }
    
    public func setupImgBg(_ isInside: Bool) {
        imgBg = UIImageView(frame: CGRect(x: 0, y: 0, width: 600, height: 600))
        imgBg.contentMode = .scaleAspectFill
        imgBg.alpha = 0.5
        
        let imageName = isInside ? "housequake" : "img_outside_building"
        let imagePath = isInside ? "png" : "jpg"
        
        guard let path = Bundle.main.path(forResource: imageName, ofType: imagePath) else {
            print("Background Image Not Found")
            return
        }
        
        imgBg.image = UIImage(contentsOfFile: path)
    }
    
    public func setupContentMain(_ isInside: Bool) {
        descText.frame = CGRect(x: 50, y: 10, width: 500, height: 200)
        descText.numberOfLines = 0
        descText.textAlignment = .center
        descText.alpha = 0.0
        descText.font = UIFont(name: K.Font.AvenirNext.DemiBold, size: 20)
        
        imgIcon.frame = CGRect(x: 200, y: 250, width: 200, height: 200)
        imgIcon.alpha = 0.0
        imgIcon.contentMode = .scaleAspectFit
        
    }
    
    public func setupNextButton() {
        nextButton.frame = CGRect(x: 175, y: 520, width: 250, height: 50)
        nextButton.isUserInteractionEnabled = true
        nextButton.setTitle("NEXT", for: .normal)
    }
    
    public func updateLabel(_ isInside: Bool) {
        let data = isInside ? K.Data.eqInData : K.Data.eqOutData
        
        if count == data.count - 1 {
            nextButton.setTitle("FINISH", for: .normal)
        }
        
        let imgName = isInside ? "in" : "out"
        guard let path = Bundle.main.path(forResource: "\(imgName)\(count)", ofType: "png") else {
            print("Icon Image Not Found")
            return
        }
        imgIcon.image = UIImage(contentsOfFile: path)
        
        descText.text = data[count]
        
        count += 1
    }
    
    public func fadeOutContent() {
        AnimationHelper.fadeOut(animatedView: descText)
        AnimationHelper.fadeOut(animatedView: imgIcon)
        
        imgIcon.layer.removeAllAnimations()
    }
    
    public func fadeInContent() {
        AnimationHelper.fadeIn(animatedView: descText)
        AnimationHelper.fadeIn(animatedView: imgIcon)
        AnimationHelper.rotateAnimation(targetView: imgIcon)
    }
    
    public func playSound(soundName: String, soundExt: String) {
        guard let url = Bundle.main.url(forResource: soundName, withExtension: soundExt) else { return }
        
        do {
            try AVAudioSession.sharedInstance().setCategory(.playback, mode: .default)
            try AVAudioSession.sharedInstance().setActive(true)
            
            playerBtnPressed = try AVAudioPlayer(contentsOf: url, fileTypeHint: AVFileType.mp3.rawValue)
            guard let player = playerBtnPressed else { return }
            
            player.play()
            
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    public func playBackSound(_ sfxName: String){
        let bgSoundURI = URL(fileURLWithPath: Bundle.main.path(forResource: sfxName, ofType: "mp3")!)
        do {
            playerBackSound = try AVAudioPlayer(contentsOf: bgSoundURI)
            playerBackSound.numberOfLoops = -1
            playerBackSound.play()
        } catch {
            print(error.localizedDescription)
        }
    }
    
    public func btnPressedSfx() {
        playSound(soundName: "buttonclicked", soundExt: "m4a")
    }
}
