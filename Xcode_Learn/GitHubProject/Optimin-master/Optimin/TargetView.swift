//
//  TargetView.swift
//  Optimin
//
//  Created by Muhammad Nashrullah on 31/03/20.
//  Copyright © 2020 Muhammad Nashrullah. All rights reserved.
//

import SwiftUI

struct TargetView: View {
    @State var showingDetail = false
    var body: some View {
        NavigationView {
            List{
                VStack{
                    Text("Yearly Goals").font(.title)
                }.padding(.top, 32)
                Text("Graduate from Apple Developer Academy")
                Text("Build a startup")
                
                
                VStack{
                    Text("Monthly Goals").font(.title).padding(.vertical, 8)
                }.padding(.top, 32)
                Text("Publish 1 apps a month")
                
                VStack{
                    Text("Daily Goals").font(.title).padding(.vertical, 8)
                }.padding(.top, 32)
                Text("13 hours a day learning")
                Text("share what you have done")
                
            }.navigationBarTitle("Target")
//            VStack {
//                NavigationLink(destination: InspirationView()
//
////                    .navigationBarHidden(true)
//                    ){
//                    Text("Inspiration")
//                }
//                Text("Target")
//                    Button(action: {
//                        self.showingDetail.toggle()
//                    }) {
//                        Text("Show Detail")
//                    }.sheet(isPresented: $showingDetail) {
//                        DetailView()
//                    }
//                .navigationBarTitle("Target")
//                    .navigationBarHidden(true)
//            }
        }
    }
}


struct DetailView: View {
    var body: some View {
        Text("Detail")
        
    }
}

struct TargetView_Previews: PreviewProvider {
    static var previews: some View {
        TargetView()
    }
}
