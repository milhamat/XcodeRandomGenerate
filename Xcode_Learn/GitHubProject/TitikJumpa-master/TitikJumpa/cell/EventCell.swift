//
//  EventCell.swift
//  TitikJumpa
//
//  Created by Ihwan ID on 09/08/20.
//  Copyright © 2020 WE4US. All rights reserved.
//

import UIKit

class EventCell: UITableViewCell {

    @IBOutlet weak var name: UILabel!
    //@IBOutlet weak var Description: UILabel!
    @IBOutlet weak var Date: UILabel!
    @IBOutlet weak var Location: UILabel!
    @IBOutlet weak var Points: UILabel!
    @IBOutlet weak var Volunteer: UILabel!
    //@IBOutlet weak var PosterView: UIImageView!
    
    
    func configure(event:Event){
        let df = DateFormatter()
        df.dateFormat = "yyyy MMM dd"
        
        
        print(event.name)
        name.text = event.name
        //PosterView.image = event.photo
        Date.text = df.string(from: event.start_date)
        Location.text = event.location
        Points.text = "\(event.points) Points"
        Volunteer.text = "\(event.total_vol) Volunteer"
        
        
    }
}
