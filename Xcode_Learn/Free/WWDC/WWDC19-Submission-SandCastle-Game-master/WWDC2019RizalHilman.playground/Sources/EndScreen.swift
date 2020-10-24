import UIKit

//
//  WWDC19 - Sand Castle Game
//
//  Created by Maulana Rizal Hilman on 21/03/19.
//  Copyright © 2019 Maulana Rizal Hilman. All rights reserved.
//

public class EndScreen: UIViewController {
    
    let closingScreen: UIImageView = {
        let image = UIImageView(image: UIImage(named: "EndScreen"))
        image.contentMode = .scaleAspectFit
        return image
    }()
    
    public override func viewDidLoad() {
        let view = UIView(frame: CGRect(x: 0, y: 0, width: 581, height: 640))
        self.view = view
        
        closingScreen.bounds = view.bounds
        closingScreen.center = view.center
        closingScreen.isUserInteractionEnabled = true
        let tap = UITapGestureRecognizer(target: self, action: #selector(goToHome))
        closingScreen.addGestureRecognizer(tap)
        view.addSubview(closingScreen)
    }
    @objc public func goToHome(){
        navigationController?.popToRootViewController(animated: true)
    }
}
