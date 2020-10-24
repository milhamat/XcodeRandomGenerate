//
//  Status.swift
//  Optimin
//
//  Created by Muhammad Nashrullah on 02/04/20.
//  Copyright © 2020 Muhammad Nashrullah. All rights reserved.
//

import SwiftUI
import Foundation

struct Status: Identifiable {
    /// unique id
    var id: String = UUID().uuidString
    
    /// user
    let user: User
    
    /// status image
    let image: String
    
    /// Init
    init(user: User, image: String) {
        self.user = user
        self.image = image
    }
}
