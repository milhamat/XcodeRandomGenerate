//
//  Stories.swift
//  TitikJumpa
//
//  Created by Sufiandy Elmy on 04/08/20.
//  Copyright © 2020 WE4US. All rights reserved.
//

import Foundation
import CloudKit
import UIKit

struct Experience{
    var recordID: CKRecord.ID?
    var volunteerID: Int
    var title: String
    var description: String
    var photo: UIImage
    var loves: Int
    
}

struct Registered_event {
    var recordID: CKRecord.ID?
    var eventID: Int
    var volunteerID: Int
    var attendance: Bool
}

struct Volunteers {
    var recordID: CKRecord.ID?
    var name: String
    var email: String
    var phone: String
    var points: Int
    var role: String
    var avatar: UIImage
    var communityID: Int
    var password: String
    
}

struct Community{
    var id = UUID()
    var recordID: CKRecord.ID?
    var address: String
    
}
