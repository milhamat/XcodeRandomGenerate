//
//  ExperienceTableViewCell.swift
//  TitikJumpa
//
//  Created by Ihwan ID on 09/08/20.
//  Copyright © 2020 WE4US. All rights reserved.
//

import UIKit
import CoreGraphics
import Accelerate

class ExperienceCell: UITableViewCell {
    
    @IBOutlet weak var labelTitle: UILabel!
    @IBOutlet weak var ImageView: UIImageView!
    @IBOutlet weak var labelDesc: UITextView!
    
    func configure(story: Experience){
        labelTitle.text = story.title
        labelDesc.text = story.description
        ImageView.image = story.photo
    }
    

}


