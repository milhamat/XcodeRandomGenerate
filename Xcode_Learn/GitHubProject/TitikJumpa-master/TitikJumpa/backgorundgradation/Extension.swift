//
//  Extension.swift
//  TitikJumpa
//
//  Created by Moh Iwangga Kalih Syah Putra on 14/08/20.
//  Copyright © 2020 WE4US. All rights reserved.
//

import Foundation
import UIKit

extension UIView {
    func setGradientBackground(colorOne: UIColor, colorTwo: UIColor) {
    
        let gradientLayer = CAGradientLayer()
        gradientLayer.frame = bounds
        gradientLayer.colors = [colorOne.cgColor, colorTwo.cgColor]
        gradientLayer.locations = [0.0, 1.0]
        gradientLayer.startPoint = CGPoint(x: 1.0, y: 1.0)
        gradientLayer.endPoint = CGPoint(x: 0.0, y:0.0)
    
        layer.insertSublayer(gradientLayer, at: 0)
    }
}
