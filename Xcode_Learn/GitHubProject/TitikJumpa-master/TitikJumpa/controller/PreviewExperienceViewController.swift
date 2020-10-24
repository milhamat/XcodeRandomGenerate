//
//  PreviewExperienceViewController.swift
//  TitikJumpa
//
//  Created by Ihwan ID on 10/08/20.
//  Copyright © 2020 WE4US. All rights reserved.
//

import UIKit
import CloudKit

class PreviewExperienceViewController: UIViewController {
    
    var image:UIImage!
    var desc: String!
    var name:String!
    var imageUrl: URL!

    
    @IBOutlet weak var imageView: UIImageView!
    @IBOutlet weak var titleLabel: UILabel!
    @IBOutlet weak var descLabel: UITextView!
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientBackground(colorOne: Colors.blue, colorTwo: Colors.white)
        imageView.image = image
        titleLabel.text = name
        descLabel.text = desc
        
    }
    
    
    @IBAction func onPostClicked(_ sender: Any) {
        // Haptic
        let generator = UINotificationFeedbackGenerator()
        generator.notificationOccurred(.success)
        
        //segue
        performSegue(withIdentifier:"BacktoExperience", sender: nil)
        
        //dialog alert
        let alert = UIAlertController(title:"Youre Catching Points!", message:"Yay! You got points from sharing your experience, keep sharing and catch more pooints!", preferredStyle: .alert)
        alert.addAction(UIAlertAction(title: "Yash!", style: .default, handler: { (UIAlertAction) in
            
        }))
        present(alert, animated: true)
        //tambah point
        
        CloudKitHelper.updatePoint(points: 5)
        
        saveExperience()
    }
    
    func saveExperience(){
        var story = Experience(recordID: CKRecord.ID(), volunteerID: 0, title: name, description: desc, photo: image, loves: 0)
        CloudKitHelper.save(story: story, url: imageUrl) { (result) in
            switch result {
            case .success(let newItem):
                print("Successfully added item \(newItem)")
                
            case .failure(let err):
                print(err.localizedDescription)
            }
        }
    }
    
}
