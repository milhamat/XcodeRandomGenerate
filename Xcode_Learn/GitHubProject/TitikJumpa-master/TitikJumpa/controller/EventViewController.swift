//
//  EventViewController.swift
//  TitikJumpa
//
//  Created by Ihwan ID on 09/08/20.
//  Copyright © 2020 WE4US. All rights reserved.
//

import UIKit

class EventViewController: UIViewController {

    @IBOutlet weak var tableView: UITableView!
    @IBOutlet weak var loading: UIActivityIndicatorView!
    
    var events: [Event] = [Event]()
    override func viewDidLoad() {
        super.viewDidLoad()
        view.setGradientBackground(colorOne: Colors.blue, colorTwo: Colors.white)
        loading.startAnimating()
        loading.isHidden = false
        tableView.isHidden = true
        tableView.backgroundColor = UIColor.clear
        tableView.delegate = self
        tableView.dataSource = self
        
        getData()
    }
    
    override func viewWillAppear(_ animated: Bool) {
        //events.removeAll()
        //getData()
    }
    
    func getData () {
        CloudKitHelper.fetchEvent { (result, isLoading) in
            switch result {
            case .success(let newEvent):
                let event: Event = newEvent
                self.events.append(event)
                DispatchQueue.main.async {
                    if (isLoading){
                        self.events.removeLast()
                        self.tableView.reloadData()
                        self.loading.stopAnimating()
                        self.tableView.isHidden = false
                        self.loading.isHidden = true
                    }
                
                }
                
            case .failure(let err):
                print(err.localizedDescription)
                self.loading.stopAnimating()
                self.tableView.isHidden = false
                self.loading.isHidden = true
            }
        }
    }
    

}

extension EventViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return 1
    }
    
    func numberOfSections(in tableView: UITableView) -> Int {
        return events.count
    }
    
    func tableView(_ tableView: UITableView, heightForHeaderInSection section: Int) -> CGFloat {
        5
    }
    
    func tableView(_ tableView: UITableView, heightForFooterInSection section: Int) -> CGFloat {
        2
    }
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 160
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        guard let cell = tableView.dequeueReusableCell(withIdentifier: "EventCell") as? EventCell else {return UITableViewCell()}
        cell.configure(event: events[indexPath.section])
//        cell.PosterView.layer.cornerRadius = cell.PosterView.frame.height / 5
        //do something here
        return cell
    }

    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        performSegue(withIdentifier: "toDetailEvent", sender: events[indexPath.section])
        //segue here
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        if (segue.identifier == "toDetailEvent") {
            guard let object = sender as? Event else { return }
            let vc = segue.destination as! DetailEventViewController
            vc.event = object
        }
    }
}
