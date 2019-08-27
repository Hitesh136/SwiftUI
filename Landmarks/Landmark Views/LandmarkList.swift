//
//  LandmarkList.swift
//  Landmarks
//
//  Created by Hitesh  Agarwal on 25/08/19.
//  Copyright © 2019 Hitesh  Agarwal. All rights reserved.
//

import SwiftUI

struct LandmarkList : View {
    
    @State var showFavoriteOnly = false
    
    var body: some View {
        NavigationView {
            
            List {

                Toggle(isOn: self.$showFavoriteOnly) {
                    Text("Favorites only")
                }
                ForEach(landmarkData) { landmark in
                    if !self.showFavoriteOnly || landmark.isFavorite {
                        NavigationButton(destination: LandmarkDetail(landmark: landmark)) {
                            LandmarkRow(landmark: landmark)
                        }
                    }
                }
            }
            .navigationBarTitle(Text("Landmarks"))
        }
    }
}

#if DEBUG
struct LandmarkList_Previews : PreviewProvider {
    static var previews: some View {
        LandmarkList()
    }
}
#endif
