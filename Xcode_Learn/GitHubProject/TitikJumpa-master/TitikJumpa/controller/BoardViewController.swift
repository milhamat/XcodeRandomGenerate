//
//  BoardViewController.swift
//  TitikJumpa
//
//  Created by Ihwan ID on 09/08/20.
//  Copyright © 2020 WE4US. All rights reserved.
//

import UIKit

class BoardViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    var volunteers: [Volunteer] = [Volunteer]()
    var isLoadData: Bool = false
    override func viewDidLoad() {
        super.viewDidLoad()
        
        tableView.delegate = self
        tableView.dataSource = self
        view.setGradientBackground(colorOne: Colors.blue, colorTwo: Colors.white)

    }
    
    override func viewWillAppear(_ animated: Bool) {
        if(!isLoadData){
            loading.startAnimating()
            loading.isHidden = false
            tableView.isHidden = true
            tableView.backgroundColor = UIColor.clear
            volunteers.removeAll()
            getData()
        }
        
    }
    
    func getData(){
        isLoadData = true
        CloudKitHelper.fetchVolunteer { (result, isLoading) in
            switch result {
            case .success(let newItem):
                let volunteer: Volunteer = newItem
                
                self.volunteers.append(volunteer)
                DispatchQueue.main.async {
                    if(isLoading){
                        self.volunteers.removeLast()
                        self.tableView.reloadData()
                        self.loading.stopAnimating()
                        self.loading.isHidden = true
                        self.tableView.isHidden = false
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

extension BoardViewController: UITableViewDelegate, UITableViewDataSource {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return volunteers.count
    }
    //TODO: fix this Index out of range
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        if(indexPath.count >= 0 && indexPath.count < volunteers.count){
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "BoardCell") as? BoardCell else {return UITableViewCell()}
        cell.configure(Volunteer: volunteers[indexPath.row], numb:  indexPath.row+1)
        cell.layer.backgroundColor = UIColor.clear.cgColor
            return cell
        }else{
            return UITableViewCell()
        }
            
        
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        //segue data here
    }
}
