//
//  PostView.swift
//  Optimin
//
//  Created by Muhammad Nashrullah on 02/04/20.
//  Copyright © 2020 Muhammad Nashrullah. All rights reserved.
//

import SwiftUI
import Foundation

struct PostView: View {
    /// post
    let post: Post
    
    /// body
    var body: some View {
        
        /// main stack
        VStack(alignment: .leading, spacing: 10) {
            
            VStack(alignment: .leading) {
                
                HStack(spacing: 10) {
                    
                    // avatar
                    AvatarView(image: post.user.avatar, size: 70)
                    
                    VStack(alignment: .leading, spacing: 3) {
                        
                        // name
                        Text(post.user.name).font(.headline)
                        // post time
                        Text(post.time).font(.subheadline)
                    }
                }
                
                // post content
                Text(post.content ?? "").font(.body).lineLimit(nil)
            }
            .padding(.leading, 15)
            .padding(.trailing, 15)
            
            Image(post.image ?? "")
                .resizable()
                .aspectRatio(3/2, contentMode: .fit)
        }
        .padding(.top, 5)
    }
}
