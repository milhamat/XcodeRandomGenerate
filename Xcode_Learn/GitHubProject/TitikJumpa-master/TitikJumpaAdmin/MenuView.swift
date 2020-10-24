//
//  MenuView.swift
//  TitikJumpaAdmin
//
//  Created by Sufiandy Elmy on 14/08/20.
//  Copyright © 2020 WE4US. All rights reserved.
//

import Foundation
import SwiftUI

struct MenuContent: View {
    var body: some View {
        List {
            Text("Profile").onTapGesture {
                    print("Profile")
                }
            Text("Event").onTapGesture {
                print("Event")
            }
            Text("Add Event").onTapGesture {
                print("Event")
            }
            Text("QR Code").onTapGesture {
                print("QR Code")
            Text("Sign out").onTapGesture {
                print("Sign out")
                    }
            }
        }
    }
}

struct SideMenu: View {
    let width: CGFloat
    let isOpen: Bool
    let menuClose: () -> Void
    
    var body: some View {
        ZStack {
            GeometryReader { _ in
                EmptyView()
            }
            .background(Color.gray.opacity(0.3))
            .opacity(self.isOpen ? 1.0 : 0.0)
            .animation(Animation.easeIn.delay(0.25))
            .onTapGesture {
                self.menuClose()
            }
            
            HStack {
                MenuContent()
                    .frame(width: self.width)
                    .background(Color.white)
                    .offset(x: self.isOpen ? 0 : -self.width)
                    .animation(.default)
                
                Spacer()
            }
        }
    }
}
