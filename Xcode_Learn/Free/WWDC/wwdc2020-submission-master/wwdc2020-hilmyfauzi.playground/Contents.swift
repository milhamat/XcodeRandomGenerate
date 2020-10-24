//: A UIKit based Playground for presenting user interface

import UIKit
import Foundation
import PlaygroundSupport

class MainVC : UIViewController {
    let lblTitle = UILabel()
    let lblDesc = UILabel()
    let btnStart = MainButton()
    let btnAbout = MainButton()
    
    let stackView = UIStackView()
    
    let delegate = QuakeDelegate()
    
    override func loadView() {
        let viewMain = UIView(frame: K.Main.defViewSize)
        viewMain.backgroundColor = .white

        // Title Label Configuration
        lblTitle.frame = CGRect(x: 25, y: 100, width: 550, height: 50)
        lblTitle.text = K.Main.titleApp
        lblTitle.textAlignment = .center
        lblTitle.font = UIFont(name: K.Font.AvenirNext.DemiBold, size: 50)
        viewMain.addSubview(lblTitle)
        
        // Desc Label Configuration
        lblDesc.frame = CGRect(x: 50, y: 150, width: 500, height: 60)
        lblDesc.text = K.Main.descApp
        lblDesc.numberOfLines = 0
        lblDesc.textAlignment = .center
        lblDesc.font = UIFont(name: K.Font.AvenirNext.Medium, size: 20)
        viewMain.addSubview(lblDesc)
        
        // Start Button Configuration
        btnStart.frame = CGRect(x: 200, y: 250, width: 200, height: 50)
        btnStart.setTitle("START", for: .normal)
        btnStart.addTarget(self, action: #selector(selectCategory), for: .touchDown)
        viewMain.addSubview(btnStart)
        
        // About Button Configuration
        btnAbout.frame = CGRect(x: 520, y: 520, width: 60, height: 60)
        btnAbout.setImage(ViewHelper.squareImgConfig(imgName: "questionmark"), for: .normal)
        btnAbout.addTarget(self, action: #selector(goToAbout), for: .touchDown)
        viewMain.addSubview(btnAbout)
        
        // Set Background Image
        let backgroundImage = UIImageView(frame: CGRect(x: 0, y: 261, width: 600, height: 339))
        backgroundImage.alpha = 0.8
        backgroundImage.contentMode = .scaleAspectFit
        backgroundImage.image = ViewHelper.setMainImg()
        viewMain.insertSubview(backgroundImage, at: 0)
        
        self.view = viewMain
    }
    
    // Function for Button About to go to About Screen
    @objc func goToAbout() {
        ViewHelper.changeView(from: self, to: AboutVC(), transition: .transitionFlipFromRight)
        delegate.btnPressedSfx()
    }
    
    // Category Selection after Start Button Pressed
    @objc func selectCategory() {
        addLocChoice()
        stackView.alpha = 0
        
        delegate.btnPressedSfx()
        
        UIView.animate(withDuration: 1) {
            self.lblDesc.alpha = 0
            self.btnStart.alpha = 0
            self.btnAbout.alpha = 0
            
            self.lblTitle.frame = CGRect(x: 25, y: 150, width: 550, height: 50)
            self.lblTitle.font = UIFont(name: K.Font.AvenirNext.DemiBold, size: 30)
            self.lblTitle.text = "Choose the Location!"
            
            self.stackView.alpha = 1
        }
        
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.lblDesc.removeFromSuperview()
            self.btnStart.removeFromSuperview()
            self.btnAbout.removeFromSuperview()
        }
    }
    
    // Transition to InBuildingVC() if Button Inside Pressed
    @objc func btnInsidePressed() {
        ViewHelper.changeView(from: self, to: InBuildingVC(), transition: .transitionFlipFromBottom)
        
        delegate.btnPressedSfx()
    }
    
    // Transition to OutBuildingVC() if Button Outside Pressed
    @objc func btnOutsidePressed() {
        ViewHelper.changeView(from: self, to: OutBuildingVC(), transition: .transitionFlipFromBottom)
        
        delegate.btnPressedSfx()
    }
    
    // Display Choice View after Button Start pressed
    func addLocChoice() {
        stackView.frame = CGRect(x: 125, y: 200, width: 350, height: 50)
        stackView.axis = .horizontal
        stackView.alignment = .fill
        stackView.distribution = .fillEqually
        stackView.spacing = 10.0
        
        let btnIndoor = ChoiceButton()
        btnIndoor.setTitle("Inside Building", for: .normal)
        btnIndoor.addTarget(self, action: #selector(btnInsidePressed), for: .touchDown)
        stackView.addArrangedSubview(btnIndoor)
        
        let btnOutdoor = ChoiceButton()
        btnOutdoor.setTitle("Outside Building", for: .normal)
        btnOutdoor.addTarget(self, action: #selector(btnOutsidePressed), for: .touchDown)
        stackView.addArrangedSubview(btnOutdoor)
        
        view.addSubview(stackView)
    }
}

class InBuildingVC : UIViewController {
    
    let delegate = QuakeDelegate()
    
    override func loadView() {
        let viewInside = UIView(frame: K.Main.defViewSize)
        viewInside.backgroundColor = .white

        delegate.setupUI(at: viewInside, isInside: true)
        delegate.nextButton.addTarget(self, action: #selector(nextBtnPressed(_:)), for: .touchUpInside)
        delegate.updateLabel(true)
        
        self.view = viewInside
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        delegate.fadeInContent()
    }
    
    @objc func nextBtnPressed(_ sender: MainButton) {
        delegate.btnPressedSfx()
        if delegate.count == K.Data.eqInData.count {
            if delegate.playerBackSound.isPlaying {
                delegate.playerBackSound.stop()
            }
            ViewHelper.changeView(from: self, to: MainVC(), transition: .transitionFlipFromTop)
        } else {
            delegate.fadeOutContent()
            delegate.updateLabel(true)
            delegate.fadeInContent()
        }
    }
}

class OutBuildingVC : UIViewController {
    
    let delegate = QuakeDelegate()
    
    override func loadView() {
        let viewOutside = UIView(frame: K.Main.defViewSize)
        viewOutside.backgroundColor = .white

        delegate.setupUI(at: viewOutside, isInside: false)
        delegate.nextButton.addTarget(self, action: #selector(nextBtnPressed(_:)), for: .touchUpInside)
        delegate.updateLabel(false)
        
        
        self.view = viewOutside
    }
    
    override func viewDidAppear(_ animated: Bool) {
        super.viewDidAppear(animated)
        delegate.fadeInContent()
    }
    
    @objc func nextBtnPressed(_ sender: MainButton) {
        delegate.btnPressedSfx()
        
        if delegate.count == K.Data.eqOutData.count {
            if delegate.playerBackSound.isPlaying {
                delegate.playerBackSound.stop()
            }
            ViewHelper.changeView(from: self, to: MainVC(), transition: .transitionFlipFromTop)
        } else {
            delegate.fadeOutContent()
            delegate.updateLabel(false)
            delegate.fadeInContent()
        }
    }
}

class AboutVC: UIViewController {
    let lblTitleAbout = UILabel()
    let lblDescAbout = UILabel()
    let lblCopyright = UILabel()
    
    let btnBack = MainButton()
    
    let delegate = QuakeDelegate()
    
    override func loadView() {
        let viewAbout = UIView(frame: K.Main.defViewSize)
        viewAbout.backgroundColor = .white

        lblTitleAbout.text = "About App"
        lblTitleAbout.frame = CGRect(x: 25, y: 100, width: 550, height: 50)
        lblTitleAbout.textAlignment = .center
        lblTitleAbout.font = UIFont(name: K.Font.AvenirNext.DemiBold, size: 50)
        viewAbout.addSubview(lblTitleAbout)
        
        lblDescAbout.text = K.Main.aboutDesc
        lblDescAbout.numberOfLines = 0
        lblDescAbout.frame = CGRect(x: 25, y: 160, width: 550, height: 250)
        lblDescAbout.textAlignment = .center
        lblDescAbout.font = UIFont(name: K.Font.AvenirNext.Regular, size: 30)
        viewAbout.addSubview(lblDescAbout)
        
        lblCopyright.text = K.Main.aboutCopyright
        lblCopyright.numberOfLines = 0
        lblCopyright.frame = CGRect(x: 50, y: 480, width: 500, height: 100)
        lblCopyright.textAlignment = .center
        lblCopyright.font = UIFont(name: K.Font.AvenirNext.Regular, size: 15)
        viewAbout.addSubview(lblCopyright)
        
        btnBack.frame = CGRect(x: 20, y: 20, width: 60, height: 60)
        btnBack.setImage(ViewHelper.squareImgConfig(imgName: "arrowshape.turn.up.left"), for: .normal)
        btnBack.addTarget(self, action: #selector(backToMenu(_:)), for: .touchDown)
        viewAbout.addSubview(btnBack)
        
        let backgroundImage = UIImageView(frame: CGRect(x: 0, y: 261, width: 600, height: 339))
        backgroundImage.contentMode = .scaleAspectFit
        backgroundImage.image = ViewHelper.setMainImg()
        backgroundImage.alpha = 0.5
        viewAbout.insertSubview(backgroundImage, at: 0)
        
        self.view = viewAbout
    }
    
    @objc func backToMenu(_ sender: MainButton) {
        delegate.btnPressedSfx()
        
        ViewHelper.changeView(from: self, to: MainVC(), transition: .transitionFlipFromLeft)
    }
}

// Present the view controller in the Live View window
let viewController = MainVC()
let navController = UINavigationController(rootViewController: viewController)

navController.isNavigationBarHidden = true
navController.view.frame = K.Main.defViewSize
PlaygroundPage.current.liveView = navController.view
