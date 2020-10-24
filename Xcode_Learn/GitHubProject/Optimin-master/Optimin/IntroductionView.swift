//
//  IntroductionView.swift
//  Optimin
//
//  Created by Muhammad Nashrullah on 31/03/20.
//  Copyright © 2020 Muhammad Nashrullah. All rights reserved.
//

import SwiftUI

struct IntroductionView: View {
    @State var selection: Int? = nil
    
    var body: some View {
        NavigationView{
            NavigationLink(destination: slide1View(), tag: 1, selection: $selection) {
                Button(action: {
                    print("login tapped")
                    self.selection = 1
                }) {
                    HStack {
                        Spacer()
                        Text("Get Started").foregroundColor(Color.black).bold()
                        Spacer()
                    }
                }
                .accentColor(Color.black)
                .padding()
                .background(Color(UIColor.white))
                .cornerRadius(4.0)
                .padding(Edge.Set.vertical, 20)
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}
struct slide1View: View{
    @State var selection: Int? = nil
    
    var body: some View {
        NavigationView{
            NavigationLink(destination: slide2View(), tag: 1, selection: $selection) {
                Button(action: {
                    print("login tapped")
                    self.selection = 1
                }) {
                    HStack {
                        Spacer()
                        Text("Get Started").foregroundColor(Color.black).bold()
                        Spacer()
                    }
                }
                .accentColor(Color.black)
                .padding()
                .background(Color(UIColor.white))
                .cornerRadius(4.0)
                .padding(Edge.Set.vertical, 20)
            }
            .navigationBarTitle("")
            .navigationBarHidden(true)
        }
    }
}
struct slide2View: View{
    @State var selection: Int? = nil
    
    var body: some View {
        NavigationView{
            NavigationLink(destination: ContentView(), tag: 1, selection: $selection) {
                Button(action: {
                    print("login tapped")
                    self.selection = 1
                }) {
                    HStack {
                        Spacer()
                        Text("Get Started").foregroundColor(Color.black).bold()
                        Spacer()
                    }
                }
                .accentColor(Color.black)
                .padding()
                .background(Color(UIColor.white))
                .cornerRadius(4.0)
                .padding(Edge.Set.vertical, 20)
            }
        .navigationBarTitle("")
        .navigationBarBackButtonHidden(true)
            .navigationBarHidden(true)
        }
    }
}
