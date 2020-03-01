//
//  ContentView.swift
//  Facebook
//
//  Created by Hitesh Agarwal on 02/02/20.
//  Copyright © 2020 Hitesh Agarwal. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    var trandings = ["Tranding1",
                     "Tranding 2",
                     "Tranding 3",
                     "Tranding 4",
                     "Tranding 5",
                     "Tranding 6"
    ]
    
    var body: some View {
        NavigationView {
            List {
                ListHeaderView(trandings: trandings)
                    .padding()
                ForEach(0..<5) {_ in 
                    FeedView()
                }
            }.padding(.leading, -16)
            .padding(.trailing, -16)
            .navigationBarTitle("Groups")
        }
    }
}



struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
