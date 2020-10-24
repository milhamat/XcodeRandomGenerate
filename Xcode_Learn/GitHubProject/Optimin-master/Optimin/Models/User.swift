//
//  User.swift
//  Optimin
//
//  Created by Muhammad Nashrullah on 02/04/20.
//  Copyright © 2020 Muhammad Nashrullah. All rights reserved.
//

import SwiftUI

struct User: Identifiable {
    /// unique id
    var id: String = UUID().uuidString
    
    /// user name
    let name: String
    
    /// user profile avatar
    let avatar: String
    
    /// Init
    init(name: String, avatar: String) {
        self.name = name
        self.avatar = avatar
    }
}
