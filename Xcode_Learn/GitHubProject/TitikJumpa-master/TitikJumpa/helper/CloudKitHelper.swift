//
//  CloudKitHelper.swift
//  TitikJumpa
//
//  Created by Sufiandy Elmy on 04/08/20.
//  Copyright © 2020 WE4US. All rights reserved.
//

import Foundation
import CloudKit
import UIKit

struct CloudKitHelper {
    
    struct RecordType {
        static let Items = "Experience"
        static let Event = "Event"
        static let Vols = "Volunteer"
    }
    
    // MARK: - errors
    enum CloudKitHelperError: Error {
        case recordFailure
        case recordIDFailure
        case castFailure
        case cursorFailure
    }
    
    static func fetchEvent(completion: @escaping (Result<Event, Error>, Bool) -> ()) {
        let pred = NSPredicate(value: true)
        let sort = NSSortDescriptor(key: "creationDate", ascending: false)
        let query = CKQuery(recordType: RecordType.Event, predicate: pred)
        query.sortDescriptors = [sort]
        
        let operation = CKQueryOperation(query: query)
        var listElement: Event!
        
        operation.recordFetchedBlock = { record in
            DispatchQueue.main.async {
                let recordID = record.recordID
                guard let name = record["name"] as? String else {return}
                guard let location = record["location"] as? String else {return}
                guard let total_vol = record["total_vol"] as? Int else {return}
                guard let points = record["points"] as? Int else {return}
                guard let start_date = record["start_date"] as? Date else {return}
                guard let end_date = record["end_date"] as? Date else {return}
                guard let qrcode = record["qrcode"] as? String else {return}
                let description = record["description"] as? String ?? "no description"
                listElement = Event(recordID: recordID, name: name, description: description, location: location, total_vol: total_vol, points: points, start_date: start_date, end_date: end_date, qrcode: qrcode)
                completion(.success(listElement), false)
            }
        }
        
        operation.queryCompletionBlock = { cursor, error in
            
            DispatchQueue.main.async {
                
                if let err = error {
                    completion(.failure(err), false)
                    return
                }else{
                    completion(.success(listElement), true)
                }
                
            }
            
        }
        
        CKContainer(identifier: "iCloud.titikjumpa").publicCloudDatabase.add(operation)
    }
    
    
    
    // MARK: - saving to CloudKit
    static func save(story: Experience, url: URL, completion: @escaping (Result<Experience, Error>) -> ()) {
        let asset = CKAsset(fileURL: url)
        
        let itemRecord = CKRecord(recordType: RecordType.Items)
        itemRecord["volunteerID"] = story.volunteerID as CKRecordValue
        itemRecord["title"] = story.title as CKRecordValue
        itemRecord["description"] = story.description as CKRecordValue
        itemRecord["loves"] = story.loves as CKRecordValue
        itemRecord["photo"] = asset
        CKContainer(identifier: "iCloud.titikjumpa").publicCloudDatabase.save(itemRecord) { (record, err) in
            DispatchQueue.main.async {
                if let err = err {
                    completion(.failure(err))
                    return
                }
                guard let record = record else {
                    completion(.failure(CloudKitHelperError.recordFailure))
                    return
                }
                let recordID = record.recordID
                guard let text = record["title"] as? String else {
                    completion(.failure(CloudKitHelperError.castFailure))
                    return
                }
                let listElement = story
                completion(.success(listElement))
            }
        }
    }
    // MARK: - fetching from CloudKit
    static func fetch(completion: @escaping (Result<Experience, Error>, Bool) -> ()){
        let pred = NSPredicate(value: true)
        let sort = NSSortDescriptor(key: "creationDate", ascending: false)
        let query = CKQuery(recordType: RecordType.Items, predicate: pred)
        query.sortDescriptors = [sort]
        
        let operation = CKQueryOperation(query: query)
        var listElement: Experience!
        
        operation.recordFetchedBlock = { record in
            DispatchQueue.main.async {
                let recordID = record.recordID
                guard let volunteerID = record["volunteerID"] as? Int else {return}
                guard let title = record["title"] as? String else {return}
                guard let decription = record["description"] as? String else {return}
                guard let loves = record["loves"] as? Int else {return}
                guard let photo = record["photo"] as? CKAsset else {return}
                 listElement = Experience(recordID: recordID, volunteerID: volunteerID, title: title, description: decription, photo: UIImage(data: NSData(contentsOf: photo.fileURL!)! as Data)!, loves: loves)
                completion(.success(listElement), false)
            }
        }
        
        
        operation.queryCompletionBlock = { cursor, error in
            
            DispatchQueue.main.async {
                if let err = error {
                    completion(.failure(err), false)
                    return
                }else{
                    completion(.success(listElement), true)
                }
                
            }
            
        }
        
        CKContainer(identifier: "iCloud.titikjumpa").publicCloudDatabase.add(operation)
    }
    
    
    
    static func fetchVolunteer(completion: @escaping (Result<Volunteer, Error>, Bool) -> ()) {
        let pred = NSPredicate(value: true)
        let sort = NSSortDescriptor(key: "point", ascending: false)
        let query = CKQuery(recordType: RecordType.Vols, predicate: pred)
        query.sortDescriptors = [sort]
        
        let operation = CKQueryOperation(query: query)
        var listElement: Volunteer!
        
        operation.recordFetchedBlock = { record in
            DispatchQueue.main.async {
                let recordID = record.recordID
                guard let name = record["name"] as? String else {return}
                guard let email = record["email"] as? String else {return}
                guard let phone = record["phone"] as? String else {return}
                guard let point = record["point"] as? Int else {return}
                guard let role = record["role"] as? Int else {return}
                guard let communityID = record["communityID"] as? Int else {return}
                
                listElement = Volunteer(recordID: recordID, name: name, email: email, phone: phone, points: point, role: role, communityID: communityID, password: "")
                
                
                completion(.success(listElement), false)
            }
        }
        
        operation.queryCompletionBlock = { cursor, error in
            
            DispatchQueue.main.async {
                
                if let err = error {
                    completion(.failure(err), false)
                    return
                }else{
                    completion(.success(listElement), true)
                }
                
            }
            
        }
        
        CKContainer(identifier: "iCloud.titikjumpa").publicCloudDatabase.add(operation)
    }
    
    static func fetchVolunteerProfile(completion: @escaping (Result<Volunteer, Error>) -> ()) {
        let emaildefault = UserDefaults.standard.object(forKey: "email") as! String
        let pred = NSPredicate(format: "email == %@", emaildefault)
        let sort = NSSortDescriptor(key: "point", ascending: false)
        let query = CKQuery(recordType: RecordType.Vols, predicate: pred)
        query.sortDescriptors = [sort]
        
        let operation = CKQueryOperation(query: query)
        
        
        operation.recordFetchedBlock = { record in
            DispatchQueue.main.async {
                let recordID = record.recordID
                guard let name = record["name"] as? String else {return}
                guard let email = record["email"] as? String else {return}
                guard let phone = record["phone"] as? String else {return}
                guard let point = record["point"] as? Int else {return}
                guard let role = record["role"] as? Int else {return}
                guard let communityID = record["communityID"] as? Int else {return}
                
                let listElement = Volunteer(recordID: recordID, name: name, email: email, phone: phone, points: point, role: role, communityID: communityID, password: "")
                
                
                completion(.success(listElement))
            }
        }
        
        operation.queryCompletionBlock = { cursor, error in
            
            DispatchQueue.main.async {
                
                if let err = error {
                    completion(.failure(err))
                    return
                }
                
            }
            
        }
        
        CKContainer(identifier: "iCloud.titikjumpa").publicCloudDatabase.add(operation)
    }
    
    static func updatePoint(points: Int){
        let emaildefault = UserDefaults.standard.object(forKey: "email") as! String
        let predicate = NSPredicate(format: "email == %@", emaildefault)
        let query = CKQuery(recordType: "Volunteer", predicate: predicate)
        let operation = CKQueryOperation(query: query)
               operation.recordFetchedBlock = { record in
                    DispatchQueue.main.async {
                        record["point"] = Int(record["point"]! + points)
                        CKContainer(identifier: "iCloud.titikjumpa").publicCloudDatabase.save(record){ (savedRecord, error) in
                            if error == nil{
                                print("Record Saved")
                            }else{
                                print("Record Not Saved")
                            }
                        }
                    }
                    
                }
        CKContainer(identifier: "iCloud.titikjumpa").publicCloudDatabase.add(operation)
        
    }
    
}
