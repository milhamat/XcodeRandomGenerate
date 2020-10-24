//
//  ProfileViewController.swift
//  TitikJumpa
//
//  Created by Ihwan ID on 09/08/20.
//  Copyright © 2020 WE4US. All rights reserved.
//

import UIKit
import CloudKit

class ProfileViewController: UIViewController {

    var volunteers: [Volunteer] = [Volunteer]()
    
    @IBOutlet weak var namalbl: UILabel!
    @IBOutlet weak var komunitaslbl: UILabel!
    @IBOutlet weak var pointlbl: UILabel!
    @IBOutlet weak var imageProfile: UIImageView!
    @IBOutlet weak var viewCard: UIView!
    override func viewDidLoad() {
        super.viewDidLoad()
 view.setGradientBackground(colorOne: Colors.blue, colorTwo: Colors.white)
        // Do any additional setup after loading the view.
//      loadProfile()
        viewCard.layer.cornerRadius = 15
        
        
    }
    override func viewWillAppear(_ animated: Bool) {
        imageProfile.layer.cornerRadius = imageProfile.frame.height / 2
        loadProfile()
    }
    
    @IBAction func signOutBtn(_ sender: Any) {
        UserDefaults.standard.set(false, forKey: "isLogin")
        performSegue(withIdentifier: "signOutSuccess", sender: nil)
    }
    func loadProfile(){
           CloudKitHelper.fetchVolunteerProfile { (result) in
               switch result {
               case .success(let newItem):
                   let volunteer: Volunteer = newItem
                   self.volunteers.append(volunteer)
                   DispatchQueue.main.async {
                       self.namalbl.text = volunteer.name
                       self.pointlbl.text = "\(volunteer.points) pts"
                   }
                   
               case .failure(let err):
                   print(err.localizedDescription)
               }
               
           }
       }
    

}
