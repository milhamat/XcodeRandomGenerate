//
//  ContentView.swift
//  Optimin
//
//  Created by Muhammad Nashrullah on 31/03/20.
//  Copyright © 2020 Muhammad Nashrullah. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    @State var selected = 0
        init () {
            UITabBar.appearance().backgroundColor = UIColor.blue
        }
        var body: some View {
            TabView (selection: $selected) {
                MainView().tabItem({
                    Image(systemName: Constants.TabBarImageName.tabBar0)
                        .font(.body)
                    Text("\(Constants.TabBarText.tabBar0)")
                }).tag(0)
                
                TargetView().tabItem({
                    Image(systemName: Constants.TabBarImageName.tabBar1)
                        .font(.body)
                    Text("\(Constants.TabBarText.tabBar1)")
                }).tag(1)
                
                InspirationView().tabItem({
                    Image(systemName: Constants.TabBarImageName.tabBar2)
                        .font(.body)
                    Text("\(Constants.TabBarText.tabBar2)")
                }).tag(2)
                
                ProfileView().tabItem({
                    Image(systemName: Constants.TabBarImageName.tabBar3)
                        .font(.body)
                    Text("\(Constants.TabBarText.tabBar3)")
                }).tag(3)
            }.accentColor(Color.white)
        }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
