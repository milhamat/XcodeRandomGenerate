//
//  Post.swift
//  Optimin
//
//  Created by Muhammad Nashrullah on 02/04/20.
//  Copyright © 2020 Muhammad Nashrullah. All rights reserved.
//

import SwiftUI
import Foundation

struct Post: Identifiable {
    /// unique id
    var id: String = UUID().uuidString
    
    /// user
    let user: User!
    
    /// post image
    let image: String?
    
    /// post content
    let content: String?
    
    /// post time
    let time: String!
    
    /// Init
    init(user: User, image: String?, content: String?, time: String) {
        self.user = user
        self.image = image
        self.content = content
        self.time = time
    }
}
