//
//  ContentView.swift
//  StopWatch
//
//  Created by Hitesh Agarwal on 02/04/20.
//  Copyright © 2020 Hitesh Agarwal. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    var body: some View {
        VStack {
//            Spacer()
            Text("08:22:22")
                .font(Font.system(size: 30))
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
