//
//  InspirationView.swift
//  Optimin
//
//  Created by Muhammad Nashrullah on 31/03/20.
//  Copyright © 2020 Muhammad Nashrullah. All rights reserved.
//

import SwiftUI

struct InspirationView: View {
    
    /// posts
    let posts = DataDummy.posts()
    @State var showingFilter = false
    
    var filterButton: some View {
        Button(action: { self.showingFilter.toggle() }) {
            Image(systemName: "slider.horizontal.3")
                .imageScale(.large)
                .accessibility(label: Text("Filter story"))
                .padding()
                .foregroundColor(.black)
        }
    }
    
    var body: some View {
        NavigationView{
            List {
                
                //                        // statuses
                //                        ScrollView(.horizontal, content: {
                //                            HStack(spacing: 10) {
                //                                ForEach(statuses) { status in
                //                                    StatusView(status: status)
                //                                }
                //                            }
                //                            .padding(.leading, 10)
                //                        })
                //                            .frame(height: 190)
                
                
                // posts
                ForEach(posts) { post in
                    PostView(post: post)
                }
            }
            .padding(.leading, -20)
            .padding(.trailing, -20)
            .navigationBarTitle("Inspiration")
            .navigationBarItems(trailing: filterButton)
            .sheet(isPresented: $showingFilter) {
                Text("Filter story")
            }
        }
        
    }
    //        NavigationView {
    //            VStack {
    //                Image("image1")
    //                    .resizable()
    //                    .aspectRatio(3/2, contentMode: .fit)
    //            }
    //            .navigationBarTitle(Text("Featured"))
    //            .navigationBarItems(trailing: filterButton)
    //            .sheet(isPresented: $showingFilter) {
    //                Text("Filter story")
    //            }
    //
    //        }
    //    }
}

struct InspirationView_Previews: PreviewProvider {
    static var previews: some View {
        InspirationView()
    }
}
