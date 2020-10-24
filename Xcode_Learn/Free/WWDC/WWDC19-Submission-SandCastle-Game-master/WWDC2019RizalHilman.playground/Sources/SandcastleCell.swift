import UIKit

//
//  WWDC19 - Sand Castle Game
//
//  Created by Maulana Rizal Hilman on 21/03/19.
//  Copyright © 2019 Maulana Rizal Hilman. All rights reserved.
//

public class SandcastleCell: UICollectionViewCell {
    let image: UIImageView = {
        let img = UIImageView(image: UIImage(named: "FirstLevel-Castlepart-08-On"))
        img.contentMode = .scaleAspectFit
        img.frame = CGRect(x: img.frame.origin.x, y: img.frame.origin.y, width: 100, height: 100)
        return img
    }()
    
    public override init(frame: CGRect) {
        super.init(frame: frame)
        addSubview(image)
    }
    
    required init?(coder aDecoder: NSCoder) {
        fatalError("init(coder:) has not been implemented")
    }
}
