//
//  CircleView.swift
//  Landmark
//
//  Created by Hitesh Agarwal on 05/01/20.
//  Copyright © 2020 Hitesh Agarwal. All rights reserved.
//


import SwiftUI

struct CircleImage: View {
    var image: Image

    var body: some View {
        image
            .clipShape(Circle())
            .overlay(Circle().stroke(Color.white, lineWidth: 4))
            .shadow(radius: 10)
    }
}

struct CircleImage_Preview: PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
