//
//  MenuRow.swift
//  TitikJumpaAdmin
//
//  Created by Ihwan ID on 11/08/20.
//  Copyright © 2020 WE4US. All rights reserved.
//

import SwiftUI

struct MenuRow: View {
    var menu: String
    
    var body: some View {
        Text(menu)
    }
}

struct MenuRow_Previews: PreviewProvider {
    static var previews: some View {
        MenuRow(menu: "Event")
    }
}
