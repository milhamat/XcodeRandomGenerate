//
//  MainView.swift
//  Optimin
//
//  Created by Muhammad Nashrullah on 31/03/20.
//  Copyright © 2020 Muhammad Nashrullah. All rights reserved.
//

import SwiftUI

struct MainView: View {
    /// statuses
    let statuses = DataDummy.statuses()
    
    /// posts
    let posts = DataDummy.posts()
    
    /// view body
    
    var body: some View {
        NavigationView{
            List {
                
                // statuses
                ScrollView(.horizontal, content: {
                    HStack(spacing: 10) {
                        ForEach(statuses) { status in
                            StatusView(status: status)
                        }
                    }
                    .padding(.leading, 10)
                })
                    .frame(height: 190)
                VStack{
                    Text("Let's Visualize").font(.title)
                }.padding(.top, 32).padding(.horizontal, 16)
                Image("image1")
                    .resizable()
                    .aspectRatio(3/2, contentMode: .fit)
                VStack{
                    Text("Yearly Goals").font(.title)
                }.padding(.top, 32).padding(.horizontal, 16)
                Text("Graduate from Apple Developer Academy").padding(.horizontal, 16)
                Text("Build a startup").padding(.horizontal, 16)
                
                
                //                // posts
                //                ForEach(posts) { post in
                //                    PostView(post: post)
                //                }
            }
            .padding(.leading, -20)
            .padding(.trailing, -20)
            .navigationBarTitle("Home")
        }
        
    }
}


struct MainView_Previews: PreviewProvider {
    static var previews: some View {
        MainView()
    }
}
