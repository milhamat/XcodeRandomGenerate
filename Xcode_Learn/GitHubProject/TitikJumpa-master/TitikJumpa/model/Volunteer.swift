//
//  Volunteer.swift
//  TitikJumpa
//
//  Created by Franky Chainoor Johari on 11/08/20.
//  Copyright © 2020 WE4US. All rights reserved.
//

import Foundation
import CloudKit
import UIKit

struct Volunteer {
    var recordID: CKRecord.ID?
    var name: String
    var email: String
    var phone: String
    var points: Int
    var role: Int
    //var avatar: UIImage
    var communityID: Int
    var password: String
}

struct VolunteerRecordID {
    var recordID: CKRecord.ID?
}
