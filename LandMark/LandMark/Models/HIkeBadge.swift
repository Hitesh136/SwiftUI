//
//  HIkeBadge.swift
//  LandMark
//
//  Created by Hitesh Agarwal on 19/01/20.
//  Copyright © 2020 Hitesh Agarwal. All rights reserved.
//

import SwiftUI

struct HIkeBadge: View {
    
    var name: String
    
    var body: some View {
        VStack(alignment: .center) {
            Badge()
                .frame(width: 300, height: 300)
                .scaleEffect(1.0 / 3.0)
                .frame(width: 100, height: 100)
            Text(name)
                .font(.caption)
                .accessibility(label: Text("Badge for \(name)."))
        }
    }
}

struct HIkeBadge_Previews: PreviewProvider {
    static var previews: some View {
        HIkeBadge(name: "Preview Testing")
    }
}
