import Foundation
import UIKit
import AVFoundation

//
//  WWDC19 - Sand Castle Game
//
//  Created by Maulana Rizal Hilman on 21/03/19.
//  Copyright © 2019 Maulana Rizal Hilman. All rights reserved.
//

public class GamePlay: UIViewController {
    
    var gameLevel = 1
    var mainBG = UIImageView()
    var referenceResult: String!
    
    // MARK: Let's define the world!
    var sky = UIImageView()
    var floor = UIView()
    lazy var castleItems = [String]()
    
    // MARK: Let's define the game attribute
    var resultHint = UIImageView()
    var clockIcon = UIImageView()
    var labelTimer = UILabel()
    var collectionView: UICollectionView!
    
    // MARK: Navigation & reference
    var hiddenCastleItems = [UIView]()
    var buttonDown = UIButton()
    var buttonUp = UIButton()
    
    
    // MARK: The final castle image will captured here
    var resultImage: UIImage?
    
    // MARK: Other needs
    var tmpCastleItem: UIView?
    var npcCrabs = [UIImageView]()
    
    // MARK: Popup Gameover Properties
    var transparentLayer: UIView = {
        let m_view = UIView(frame: UIScreen.main.bounds)
        m_view.backgroundColor = UIColor.black.withAlphaComponent(0.5)
        return m_view
    }()
    
    var popUpContainer: UIView = {
        let m_view = UIView(frame: CGRect(x: 0, y: 0, width: 400, height: 500))
        m_view.backgroundColor = #colorLiteral(red: 1, green: 0.9691014886, blue: 0.8631896377, alpha: 1)
        return m_view
    }()
    
    var buttonRestart: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 72, height: 72))
        button.setImage(UIImage(named: "ButtonRestart"), for: .normal)
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    var buttonShare: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 72, height: 72))
        button.setImage(UIImage(named: "ButtonShare"), for: .normal)
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    var buttonNext: UIButton = {
        let button = UIButton(frame: CGRect(x: 0, y: 0, width: 72, height: 72))
        button.setImage(UIImage(named: "ButtonNext"), for: .normal)
        button.contentMode = .scaleAspectFit
        return button
    }()
    
    var imageResultPreview: UIImageView = {
        let image = UIImageView(frame: CGRect(x: 0, y: 0, width: 281, height: 310))
        image.image = UIImage(named: "HomeMainBG")
        image.contentMode = .scaleAspectFit
        image.clipsToBounds = true
        return image
    }()
    
    // MARK: Animation
    var animator: UIDynamicAnimator?
    var gravityBH: UIGravityBehavior?
    var collisionBH: UICollisionBehavior?
    
    // Multimedia
    var soundURI: URL?
    var audioPlayer = AVAudioPlayer()
    
    // Max playing time
    var maxTime = 15
    var timeRemaining = 0
    var gameTimer: Timer!
    
    public override func viewDidLoad() {
        super.viewDidLoad()
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 581, height: 640))
        self.view = view
        
        /************************************************
         * Setup View
         *************************************************/
        // MARK: Draw the background of our world
        mainBG = UIImageView(frame: CGRect(x: 0, y: 0, width: 581, height: 640))
        mainBG.image = UIImage(named: "FirstLevelBG")
        mainBG.contentMode = .scaleAspectFit
        view.addSubview(mainBG)
        
        // MARK: Make beauty with the sky
        sky = UIImageView(frame: CGRect(x: 0, y: 50, width: view.frame.width, height: 250))
        sky.image = UIImage(named: "FirstLevel-Castlepart-09-Sky")
        sky.contentMode = .scaleAspectFit
        view.addSubview(sky)
        
        // MARK: Of course we will have a floor
        floor = UIView(frame: CGRect(x: 0, y: view.frame.height - 65, width: view.frame.width, height: 65))
        hiddenCastleItems.append(floor)
        view.addSubview(floor)
        
        // If it's level 2 & 3, draw the crabs
        if gameLevel > 1 {
            DispatchQueue.main.asyncAfter(wallDeadline: .now() + Double.random(in: 5.0...10.0)) {
                // Crabs NPC
                for i in 1...(Int.random(in: 3...6)) {
                    // Make random x, y position
                    let x_pos = Int.random(in: 10...500) / i
                    let y_pos = (i + Int.random(in: 70...90)) + Int.random(in: 480...520)
                    let crab = UIImageView(frame: CGRect(x: x_pos, y: y_pos, width: 65, height: 65))
                    crab.image = UIImage(named: "NPCCrab")
                    crab.contentMode = .scaleAspectFit
                    crab.isUserInteractionEnabled = true
                    
                    let tapToKil = UITapGestureRecognizer(target: self, action: #selector(self.onCrabTapped))
                    crab.addGestureRecognizer(tapToKil)
                    self.view.addSubview(crab)
                    self.npcCrabs.append(crab)
                }
                
                // MARK: Animate the crabs
                for i in 0..<self.npcCrabs.count {
                    let crab = self.npcCrabs[i]
                    crab.isUserInteractionEnabled = true
                    UIView.animate(withDuration: Double.random(in: 6.0...10.0), delay: Double.random(in: 0.5...1.8), options: [.allowUserInteraction], animations: {
                        // Move randomly x, y
                        // Uncomment this to make the crab move
//                        let crab_x = crab.center.x
//                        var crab_x_max: CGFloat = 0.0
//                        crab_x_max = CGFloat.random(in: crab_x...(crab_x + 100.0))
//                        if i%2 == 1 {
//                            crab.center = CGPoint(x: -crab_x_max, y: crab.center.y)
//                        } else {
//                            crab.center = CGPoint(x: crab_x_max, y: crab.center.y)
//                        }
                        
                    }) { (true) in
                        // Gone the crab randomly
                        DispatchQueue.main.asyncAfter(wallDeadline: .now() + Double.random(in: 2.0...5.0), execute: {
                            crab.explode(duration: 0.5)
                        })
                    }
                }
            }
            
        }
        
        // MARK: Setup the castle items catalogue
        let layout: UICollectionViewFlowLayout = UICollectionViewFlowLayout()
        layout.sectionInset = UIEdgeInsets(top: 10, left: 10, bottom: 10, right: 10)
        layout.itemSize = CGSize(width: 100, height: 100)
        layout.scrollDirection = .vertical
        
        collectionView = UICollectionView(frame: CGRect(x: view.frame.width - 120 , y: 50, width: 100, height: 350), collectionViewLayout: layout)
        collectionView.dataSource = self
        collectionView.delegate = self
        collectionView.dragInteractionEnabled = true
        collectionView.register(SandcastleCell.self, forCellWithReuseIdentifier: "MyCell")
        collectionView.backgroundColor = UIColor.clear.withAlphaComponent(0)
        view.addSubview(collectionView)
        
        // When first load, auto select & scroll the index in collection view set Index 0
        collectionView.selectItem(at: IndexPath(item: 0, section: 0), animated: true, scrollPosition: .left)
        
        // We need next & prev to scroll item catalogue
        buttonDown = UIButton(frame: CGRect(x: 0, y: collectionView.frame.height + 60, width: 72, height: 30))
        buttonDown.center.x = collectionView.center.x
        buttonDown.setImage(UIImage(named: "ArrowBottom"), for: .normal)
        buttonDown.addTarget(self, action: #selector(scrollDown(_:)), for: .touchUpInside)
        
        buttonUp = UIButton(frame: CGRect(x: 0, y: collectionView.frame.origin.y - 30, width: 72, height: 30))
        buttonUp.center.x = collectionView.center.x
        buttonUp.setImage(UIImage(named: "ArrowTop"), for: .normal)
        buttonUp.addTarget(self, action: #selector(scrollUp(_:)), for: .touchUpInside)
        
        view.addSubview(buttonUp)
        view.addSubview(buttonDown)
        
        // If the items of castles if < 3, so we don't need te up bottom button
        if castleItems.count < 4 {
            buttonUp.isHidden = true
            buttonDown.isHidden = true
        }
        
        // Image Reference Of Castle
        let x_pos_hint = view.frame.width - 170
        let y_pos_hint = view.frame.height - 190
        resultHint = UIImageView(frame: CGRect(x: 0, y: 0, width: 153, height: 177))
        resultHint.center = view.center
        resultHint.transform = CGAffineTransform(scaleX: 3.0, y: 3.0)
        resultHint.image = UIImage(named: referenceResult)
        resultHint.contentMode = .scaleAspectFit
        view.addSubview(resultHint)
        
        // Add icon for timer
        clockIcon = UIImageView(frame: CGRect(x: 20, y: 20, width: 60, height: 60))
        clockIcon.image = UIImage(named: "FirstLevel-Castlepart-05-Clock")
        clockIcon.contentMode = .scaleAspectFit
        view.addSubview(clockIcon)
        
        // Label Count Down
        timeRemaining = maxTime
        let x_pos_label_timer = 100
        let y_pos_label_timer = 20
        labelTimer = UILabel(frame: CGRect(x: x_pos_label_timer, y: y_pos_label_timer, width: 350, height: 60))
        labelTimer.center = view.center
        labelTimer.text = "GET READY!!"
        
        let fontURL = Bundle.main.url(forResource: "D-DIN-Bold", withExtension: "ttf")
        CTFontManagerRegisterFontsForURL(fontURL! as CFURL, CTFontManagerScope.process, nil)
        let font = UIFont(name: "D-DIN-Bold", size: 60.0)!
        
        labelTimer.font = font
        labelTimer.textColor = #colorLiteral(red: 1, green: 0.3281747699, blue: 0.4034234285, alpha: 1)
        view.addSubview(labelTimer)
        
        /************************************************
         * Animation
         *************************************************/
        // Initialize the animator
        animator = UIDynamicAnimator(referenceView: self.view)
        // MARK: Cloud Animation
        UIView.animate(withDuration: 2.0, delay: 0, options: [.autoreverse, .repeat, .curveEaseInOut], animations: {
            self.sky.frame.origin.x += 80
        })
        // MARK: Image Reference Animation
        UIView.animate(withDuration: 1.5, delay: 1, options: [.curveEaseInOut], animations: {
            // Move to bottom right corner & scale
            self.resultHint.transform = CGAffineTransform(scaleX: 1.0, y: 1.0)
            self.resultHint.frame.origin = CGPoint(x: x_pos_hint, y: y_pos_hint)
            self.labelTimer.frame.origin = CGPoint(x: x_pos_label_timer, y: y_pos_label_timer)
        }) { (true) in
            // Start Game Timer
            self.labelTimer.textColor = #colorLiteral(red: 0.9764705896, green: 0.850980401, blue: 0.5490196347, alpha: 1)
            self.labelTimer.text = "START!"
            self.collectionView.shake()
            //self.labelTimer.shake()
            self.gameTimer = Timer.scheduledTimer(timeInterval: 1, target: self, selector: #selector(self.runGameTimer), userInfo: nil, repeats: true)
        }
    }
    
    // MARK: On castle item selected
    public func showCastleItemSelected(itemAt: Int, position: CGPoint){
        let img = UIImage(named: castleItems[itemAt])
        let castleItem = UIImageView(image: img)
        castleItem.contentMode = .left
        castleItem.center = position
        castleItem.isUserInteractionEnabled = true
        
        // Add move gesture
        let moveGS = UIPanGestureRecognizer(target: self, action: #selector(self.gestureMoveObject(_:)))
        moveGS.delegate = self
        let doubleTap = UITapGestureRecognizer(target: self, action: #selector(self.doubleTapOnItem(_:)))
        doubleTap.numberOfTapsRequired = 2
        
        castleItem.addGestureRecognizer(doubleTap)
        castleItem.addGestureRecognizer(moveGS)
        view.addSubview(castleItem)
        
        // ANIMATOR
        var itemToAnimate = hiddenCastleItems
        itemToAnimate.append(castleItem)
        let viewIndexOnArray = hiddenCastleItems.count
        castleItem.tag = viewIndexOnArray
        hiddenCastleItems = itemToAnimate
        
        // Gravity
        gravityBH = UIGravityBehavior(items: hiddenCastleItems)
        let direction = CGVector(dx: 0.0, dy: 0.5)
        gravityBH?.gravityDirection = direction
        
        // Collision
        collisionBH = UICollisionBehavior(items: hiddenCastleItems)
        collisionBH?.translatesReferenceBoundsIntoBoundary = true
        
        // Add behavior when item added
        animator?.addBehavior(gravityBH!)
        animator?.addBehavior(collisionBH!)
        // Ignore removed view from behaviour
        
        for viewItem in removedViews {
            gravityBH?.removeItem(viewItem)
            collisionBH?.removeItem(viewItem)
        }
        
        // Make Several View Always On Top Layer
        view.bringSubviewToFront(resultHint)
        view.bringSubviewToFront(labelTimer)
        view.bringSubviewToFront(clockIcon)
        view.bringSubviewToFront(collectionView)
        view.bringSubviewToFront(buttonUp)
        view.bringSubviewToFront(buttonDown)
        resultHint.sendSubviewToBack(labelTimer)
    }
    
    // MARK: Game Timer
    @objc public func runGameTimer(){
        labelTimer.textColor = #colorLiteral(red: 0.6495288014, green: 0.4879968762, blue: 0, alpha: 1)
        timeRemaining -= 1
        if timeRemaining < 10 {
            labelTimer.text = "0\(timeRemaining)"
        } else {
            labelTimer.text = "\(timeRemaining)"
        }
        // MARK: Give the time warning!
        if timeRemaining < 6 {
            clockIcon.shake()
        }
        
        // MARK: Notice the time is up!
        if timeRemaining < 0 {
            gameTimer.invalidate()
            labelTimer.text = "TIMES UP!"
            labelTimer.textColor = .red
            clockIcon.image = UIImage(named: "FirstLevel-Castlepart-05-Times-Up")
            clockIcon.shake()
            
            // Play alarm
            playAlarm()
            
            // Show popup with delay
            DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
                self.showPopUpGameOver()
            }
        }
    }
    
    // MARK: Game over popup
    public func showPopUpGameOver(){
        popUpContainer.center = view.center
        popUpContainer.layer.cornerRadius = 20
        buttonRestart.center.x = view.center.x
        
        buttonNext.center.x = view.frame.width - popUpContainer.frame.origin.x - 50
        buttonShare.center.x = popUpContainer.frame.origin.x + 50
        
        buttonShare.frame.origin.y = view.frame.height - popUpContainer.frame.origin.y - buttonRestart.frame.height - 20
        buttonNext.frame.origin.y = view.frame.height - popUpContainer.frame.origin.y - buttonRestart.frame.height - 20
        buttonRestart.frame.origin.y = view.frame.height - popUpContainer.frame.origin.y - buttonRestart.frame.height - 20
        
        imageResultPreview.center = popUpContainer.center
        imageResultPreview.center.y -= 30
        imageResultPreview.layer.cornerRadius = 10
        imageResultPreview.backgroundColor = .red
        
        
        // MARK: Define Action when button triggered
        buttonRestart.addTarget(self, action: #selector(restart), for: .touchUpInside)
        buttonShare.addTarget(self, action: #selector(share), for: .touchUpInside)
        buttonNext.addTarget(self, action: #selector(nextLevel), for: .touchUpInside)
        
        // MARK: Hide several views
        hideUncapturableViews()
        
        // MARK: Render view as image
        let renderer = UIGraphicsImageRenderer(size: view.bounds.size)
        let image = renderer.image { (ctx) in
            view.drawHierarchy(in: view.bounds, afterScreenUpdates: true)
        }
        self.resultImage = image
        
        // MARK: Show again that views
        showUncapturableViews()
        
        imageResultPreview.image = image
        view.addSubview(transparentLayer)
        view.addSubview(popUpContainer)
        view.addSubview(imageResultPreview)
        view.addSubview(buttonRestart)
        view.addSubview(buttonNext)
        view.addSubview(buttonShare)
    }
    
    // When capturing your castle,
    // we need to hide some views so that they are won't captured in the picture
    func hideUncapturableViews()  {
        collectionView.isHidden = true
        labelTimer.isHidden = true
        clockIcon.isHidden = true
        resultHint.isHidden = true
        buttonUp.isHidden = true
        buttonDown.isHidden = true
    }
    
    // After capturin complete, show agan the current hidden views
    func showUncapturableViews() {
        collectionView.isHidden = false
        labelTimer.isHidden = false
        clockIcon.isHidden = false
        resultHint.isHidden = false
        buttonUp.isHidden = false
        buttonDown.isHidden = false
    }
    
    // MARK: Play your audio file
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
    
    public func playAlarm(){
        self.playSound(file: "Alarm", fileExtension: "wav")
    }
    
    public func playTouchSound(){
        self.playSound(file: "touch_sound", fileExtension: "mp3")
    }
    
    public func playSandSound(){
        self.playSound(file: "SandSoundEffect", fileExtension: "wav")
    }
    
    // MARK: Button Next, Prev Castle Item
    var currentLastIndexRow = 1
    @objc func scrollDown(_ sender: UIButton){
        self.playTouchSound()
        if currentLastIndexRow < (castleItems.count - 2) {
            currentLastIndexRow += 1
            let indexPath = IndexPath(item: currentLastIndexRow, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredVertically, animated: true)
        }
    }

    @objc func scrollUp(_ sender: UIButton){
        self.playTouchSound()
        Helpers().playBackSound(file: "touch_sound", fileExtension: "mp3")
        if currentLastIndexRow > 1 {
            currentLastIndexRow -= 1
            let indexPath = IndexPath(item: currentLastIndexRow, section: 0)
            collectionView.scrollToItem(at: indexPath, at: .centeredVertically, animated: true)
        }
    }
    
    // MARK: Gesture to move selected object
    @objc func gestureMoveObject(_ sender: UIPanGestureRecognizer){
        if sender.state == .ended {
            animator?.addBehavior(gravityBH!)
            animator?.addBehavior(collisionBH!)
        } else if sender.state == .began {
            animator?.removeAllBehaviors()
        } else {
            sender.view?.center = sender.location(in: view)
        }
    }
    
    // MARK: Show selected castle item
    @objc func doubleTapOnItem(_ sender: UIGestureRecognizer){
        guard let index = sender.view?.tag else {return}
        
        // MARK: Reset behaviour
        self.animator?.removeAllBehaviors()
        // Gravity
        self.gravityBH = UIGravityBehavior(items: self.hiddenCastleItems)
        let direction = CGVector(dx: 0.0, dy: 0.5)
        self.gravityBH?.gravityDirection = direction

        // Collision
        self.collisionBH = UICollisionBehavior(items: self.hiddenCastleItems)
        self.collisionBH?.translatesReferenceBoundsIntoBoundary = true
        
        self.animator?.addBehavior(self.gravityBH!)
        self.animator?.addBehavior(self.collisionBH!)
        
        removedViews.append(hiddenCastleItems[index])
        // Ignore the removed views from the behaviour
        for viewItem in removedViews {
            gravityBH?.removeItem(viewItem)
            collisionBH?.removeItem(viewItem)
        }
        
        // Now, explode the view with sound!
        playSandSound()
        sender.view?.explode(.bottom, duration: 1.2)
        
    }
    
    // MARK: When selected item dragged
    var removedViews = [UIView]()
    @objc func onPan(_ sender: UIPanGestureRecognizer){
        
        if timeRemaining <= 0 { // if time is over, Stop! you can't add item anymore
            return
        }
        
        // MARK: Define location in view when item will appear
        let position = sender.location(in: view)
        let indexItem = sender.view?.tag
        
        if sender.state == .began {
            
            self.playTouchSound()
            let img = UIImage(named: castleItems[indexItem!])
            tmpCastleItem = UIImageView(image: img)
            tmpCastleItem?.contentMode = .left
            tmpCastleItem?.center = position
            view.addSubview(tmpCastleItem!)
        } else if sender.state == .ended {
            showCastleItemSelected(itemAt: indexItem!, position: position)
            tmpCastleItem?.removeFromSuperview()
        } else {
            tmpCastleItem?.center = position
        }
    }
    
    // MARK: On Popup Game Over
    @objc public func restart(){
        self.playTouchSound()
        let vc = GamePlay()
        vc.castleItems = self.castleItems
        vc.gameLevel = self.gameLevel
        vc.maxTime = self.maxTime
        vc.referenceResult = self.referenceResult
        
        navigationController?.pushViewController(vc, animated: false)
    }
    // MARK: On crab catched!
    @objc public func onCrabTapped(_ sender: UITapGestureRecognizer){
        sender.view?.explode(duration: 1)
        playSound(file: "ItemCollected", fileExtension: "wav")
        labelTimer.shake()
        timeRemaining += 3
    }
    
    // MARK: Share your castle to the whole world!
    @objc public func share(){
        self.playTouchSound()
        guard let image = resultImage else {return}
        
        let imageToShare = [image]
        let activityViewController = UIActivityViewController(activityItems: imageToShare, applicationActivities: nil)

        self.present(activityViewController, animated: true, completion: nil)
    }
    
    // MARK: Move to the next level
    @objc public func nextLevel(){
        self.playTouchSound()
        
        gameLevel += 1
        let vc = GamePlay()
        
        // MARK: Setup data for the next level
        switch gameLevel {
            case 2:
                let tutorVc = Tutorial()
                tutorVc.nextGameLevel = 2
                tutorVc.tutorialImages = ["Tutor-05", "Tutor-06"]
                navigationController?.pushViewController(tutorVc, animated: true)
                return
            case 3:
                vc.castleItems = ["ThirdLevel-Castlepart-01",
                                  "ThirdLevel-Castlepart-02",
                                  "ThirdLevel-Castlepart-03",
                                  "ThirdLevel-Castlepart-04",
                                  "ThirdLevel-Castlepart-05",
                                  "ThirdLevel-Castlepart-06",
                                  "ThirdLevel-Castlepart-07",
                                  "ThirdLevel-Castlepart-08",
                                  "ThirdLevel-Castlepart-09",
                                  "ThirdLevel-Castlepart-10",
                ]
                vc.gameLevel = 3
                vc.maxTime = 40
                vc.referenceResult = "ReferenceResult03"
            
            default:
                let alert = UIAlertController(title: "Want's More?", message: nil, preferredStyle: .alert)
                alert.addAction(UIAlertAction(title: "Yes!", style: .default, handler: { (alert) in
                    self.navigationController?.pushViewController(EndScreen(), animated: true)
                }))
                self.present(alert, animated: true)
                
                return
        }
        
        navigationController?.pushViewController(vc, animated: true)
    }
}

extension GamePlay:  UICollectionViewDataSource, UICollectionViewDelegate, UIGestureRecognizerDelegate {
    public func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        return castleItems.count
    }
    public func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let myCell = collectionView.dequeueReusableCell(withReuseIdentifier: "MyCell", for: indexPath) as! SandcastleCell
        myCell.tag = indexPath.row
        if indexPath.row == 0 {
            myCell.image.image = UIImage(named: "\(self.castleItems[indexPath.row])-On")
        } else {
            myCell.image.image = UIImage(named: "\(self.castleItems[indexPath.row])-Off")
        }
        // MARK: Add gesture to the cell
        let pan = UIPanGestureRecognizer(target: self, action: #selector(onPan(_:)))
        pan.cancelsTouchesInView = false
        myCell.addGestureRecognizer(pan)
        
        return myCell
    }
    
    // MARK: Drag & drop castle item from cell
    public func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
        self.playTouchSound()
        let cell = collectionView.cellForItem(at: indexPath) as? SandcastleCell
        cell?.image.image = UIImage(named: "\(self.castleItems[indexPath.row])-On")
        let itemPosition = CGPoint(x: view.center.x, y: (view.center.y - 200))
        showCastleItemSelected(itemAt: indexPath.row, position: itemPosition)
    }
    
    public func collectionView(_ collectionView: UICollectionView, didDeselectItemAt indexPath: IndexPath) {
        let cell = collectionView.cellForItem(at: indexPath) as? SandcastleCell
        cell?.image.image = UIImage(named: "\(self.castleItems[indexPath.row])-Off")
    }
    
}
