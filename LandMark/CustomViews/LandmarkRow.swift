//
//  LandMarkRow.swift
//  Landmark
//
//  Created by Hitesh Agarwal on 05/01/20.
//  Copyright © 2020 Hitesh Agarwal. All rights reserved.
//

import SwiftUI

struct LandmarkRow: View {
    
    var landMark: Landmark
    var body: some View {
        HStack {
            landMark.image
            .resizable()
                .frame(width: 50, height: 50)
            Text(landMark.name)
            Spacer()
        }
        
    }
}

struct LandmarkRow_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkRow(landMark: landmarkData.randomElement()!)
    }
}
