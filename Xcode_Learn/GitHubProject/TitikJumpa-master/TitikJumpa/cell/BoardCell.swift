//
//  BoardCell.swift
//  TitikJumpa
//
//  Created by Ihwan ID on 14/08/20.
//  Copyright © 2020 WE4US. All rights reserved.
//
import UIKit

class BoardCell: UITableViewCell {
    
    @IBOutlet weak var noLabel: UILabel!
    @IBOutlet weak var nameLabel: UILabel!
    @IBOutlet weak var pointLabel: UILabel!
    
    func configure(Volunteer: Volunteer, numb: Int){
        nameLabel.text = Volunteer.name
        pointLabel.text = "\(Volunteer.points) Points"
        noLabel.text = "\(numb)"
    }
    
}
