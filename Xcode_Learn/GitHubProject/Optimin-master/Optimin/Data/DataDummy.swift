//
//  DataDummy.swift
//  Optimin
//
//  Created by Muhammad Nashrullah on 02/04/20.
//  Copyright © 2020 Muhammad Nashrullah. All rights reserved.
//

import Foundation

struct DataDummy {
    // users
    static let userTimCook     =   User(name: "Danan", avatar: "user")
    static let userSteveJobs   =   User(name: "Rasid", avatar: "user")
    static let userCraig       =   User(name: "Reynaldi Wijaya", avatar: "user")
    static let userElonMusk    =   User(name: "Elmy", avatar: "user")
    
    
    
    /// posts
    static func posts() -> [Post] {
        let post1 = Post(user: userTimCook, image: "scene1",
                         content: "Investasi merupakan hal yang harus kamu mulai sedini mungkin baik itu Investasi Jangka Pendek... ",
                         time: "Just now")
        
        let post2 = Post(user: userSteveJobs, image: "scene2",
                         content: "Padahal sebaliknya, jika kamu sudah memahami apa itu investasi, kenapa kita harus berinvestasi...",
                         time: "2 mins ago")
        
        let post3 = Post(user: userCraig, image: "scene3",
                         content: "Investasi merupakan hal yang harus kamu mulai sedini mungkin baik itu Investasi Jangka Pendek...",
                         time: "an hour ago")
        
        let post4 = Post(user: userElonMusk, image: "scene4",
                         content: "adahal sebaliknya, jika kamu sudah memahami apa itu investasi, kenapa kita harus berinvestasi...",
                         time: "yesterday")
        
        return [post1, post2, post3, post4]
    }
    
    
    /// statuses
    static func statuses() -> [Status] {
        let status1 = Status(user: userSteveJobs, image: "scene2")
        let status2 = Status(user: userTimCook, image: "scene4")
        let status3 = Status(user: userElonMusk, image: "scene1")
        let status4 = Status(user: userCraig, image: "scene3")
        
        return [status1, status2, status3, status4]
    }

}
