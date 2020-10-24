//
//  ExperienceViewController.swift
//  TitikJumpa
//
//  Created by Ihwan ID on 09/08/20.
//  Copyright © 2020 WE4US. All rights reserved.
//

import UIKit
import CloudKit
class ExperienceViewController: UIViewController {
    
    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    var experiences: [Experience] = [Experience]()
    var isLoadData: Bool = false
    
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientBackground(colorOne: Colors.blue, colorTwo: Colors.white)
        tableView.delegate = self
        tableView.dataSource = self
//        fetchData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        
        if(!isLoadData){
            loading.startAnimating()
            loading.isHidden = false
            tableView.isHidden = true
            tableView.backgroundColor = UIColor.clear
            experiences.removeAll()
            fetchData()
        }
        
    }
    
    func fetchData(){
        isLoadData = true
        CloudKitHelper.fetch { (result, isLoading)  in
            switch result {
            case .success(let newItem):
                let experience: Experience = newItem
                self.experiences.append(experience)
                DispatchQueue.main.async {
                    if(isLoading){
                        self.experiences.removeLast()
                        self.tableView.reloadData()
                        self.loading.stopAnimating()
                        self.tableView.isHidden = false
                        self.loading.isHidden = true
                        self.isLoadData = false
                    }
                }
                
                
            case .failure(let err):
                print(err.localizedDescription)
            }
            //add data here
        }
    }
    
}

extension ExperienceViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return experiences.count
    }

    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 114
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        5
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        2
    }
    
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.section >= 0 && indexPath.section < experiences.count){
            guard let cell = tableView.dequeueReusableCell(withIdentifier: "ExperienceCell") as? ExperienceCell else {return UITableViewCell()}
                   cell.configure(story: experiences[indexPath.section])
                   
                   return cell
        }else{
            return UITableViewCell()
        }
       
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetailExperience", sender: experiences[indexPath.section])
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toDetailExperience") {
            guard let object = sender as? Experience else { return }
            let vc = segue.destination as! DetailExperienceViewController
            vc.experience = object
        }
    }
}
