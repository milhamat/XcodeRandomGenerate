//
//  DetailExperienceViewController.swift
//  TitikJumpa
//
//  Created by Ihwan ID on 10/08/20.
//  Copyright © 2020 WE4US. All rights reserved.
//

import UIKit

class DetailExperienceViewController: UIViewController {

    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var desc: UITextView!
    
    var experience: Experience!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        titleLabel.text = experience.title
        imageView.image = experience.photo
        desc.text = experience.description
    }

}
