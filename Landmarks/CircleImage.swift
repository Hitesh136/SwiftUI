//
//  CircleImage.swift
//  Landmarks
//
//  Created by Hitesh  Agarwal on 25/08/19.
//  Copyright © 2019 Hitesh  Agarwal. All rights reserved.
//

import SwiftUI

struct CircleImage : View {
    
    var image: Image
    var body: some View {
        image
        .clipShape(Circle())
        .overlay(
            Circle().stroke(Color.white, lineWidth: 4))
        .shadow(radius: 10)
    }
}

#if DEBUG
struct CircleImage_Previews : PreviewProvider {
    static var previews: some View {
        CircleImage(image: Image("turtlerock"))
    }
}
#endif
