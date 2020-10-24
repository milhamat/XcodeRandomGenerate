//
//  DetailEventViewController.swift
//  TitikJumpa
//
//  Created by Sufiandy Elmy on 11/08/20.
//  Copyright © 2020 WE4US. All rights reserved.
//

import UIKit
import CloudKit

class DetailEventViewController: UIViewController {
    
    var eventsCalendarManager = EventsCalendarManager()
    var event: Event!
    
    @IBOutlet weak var titleEvent: UILabel!
    @IBOutlet weak var descriptionEvent: UITextView!
    @IBOutlet weak var hour: UILabel!
    @IBOutlet weak var date: UILabel!
    @IBOutlet weak var location: UILabel!
    @IBOutlet weak var volunterVolume: UILabel!
    @IBOutlet weak var points: UILabel!
    
   
    @IBAction func onSaveEventClicked(_ sender: Any) {
        
        addEventToCalendar()
    }
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        let df = DateFormatter()
        df.dateFormat = "dd MMM yyyy"
        
        let hf = DateFormatter()
        hf.dateFormat = "hh:mm"
        self.navigationController?.navigationBar.largeTitleTextAttributes = [NSAttributedString.Key.foregroundColor : UIColor.white]
        titleEvent.text = event.name
        descriptionEvent.text = event.description
        hour.text = "\(hf.string(from: event.start_date)) - \(hf.string(from: event.end_date))"
        date.text = df.string(from: event.start_date)
        location.text = "\(event.location)"
        points.text = "\(event.points) Points"
        volunterVolume.text = "\(event.total_vol)"
    }
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
           if (segue.identifier == "toQR") {
               guard let object = sender as? Event else { return }
               let vc = segue.destination as! QRScannerController
               vc.event = object
           }
       }
    
    func addEventToCalendar() {
        
        eventsCalendarManager.addEventToCalendar(event: event) { (result) in
            switch result {
            case .success:
                let alert = UIAlertController(title: "Success!", message: "Success Add event to Calendar! you will be notified one day before", preferredStyle: .alert)

                alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))

                self.present(alert, animated: true)
            case .failure(let error):
                switch error {
                case .calendarAccessDeniedOrRestricted:
                    let alert = UIAlertController(title: "Calendar Access Denied!", message: "Please Give Permission for Calendar!", preferredStyle: .alert)

                    alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))
                    self.present(alert, animated: true)
                case .eventNotAddedToCalendar:
                    let alert = UIAlertController(title: "Event Not Added!", message: "Event not added to calendar. make sure you give permission for it", preferredStyle: .alert)

                    alert.addAction(UIAlertAction(title: "Yes", style: .default, handler: nil))

                    self.present(alert, animated: true)
                case .eventAlreadyExistsInCalendar:
                    let alert = UIAlertController(title: "Already Exist!", message: "Event Already exist in calendar)", preferredStyle: .alert)

                    alert.addAction(UIAlertAction(title: "Attendace", style: .default, handler: { action in
                        self.performSegue(withIdentifier: "toQR", sender: self.event)
                       
                    }))

                    self.present(alert, animated: true)
                default: ()
                }
            }
        }
    }
    
}
