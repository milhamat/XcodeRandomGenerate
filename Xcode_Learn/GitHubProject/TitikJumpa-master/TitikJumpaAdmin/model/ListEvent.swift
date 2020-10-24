//
//  ListElement.swift
//  TitikJumpaAdmin
//
//  Created by Ihwan ID on 11/08/20.
//  Copyright © 2020 WE4US. All rights reserved.
//

import SwiftUI
import CloudKit

struct Event: Identifiable {
    var id = UUID()
    var recordID: CKRecord.ID?
    var name: String
    var location: String
    var total_vol: Int
    var points: Int
    var start_date: Date
    var end_date: Date
    //var photo: UIImage
    var qrcode: String
}

class ListEvent: ObservableObject {
    @Published var events: [Event] = []
}
