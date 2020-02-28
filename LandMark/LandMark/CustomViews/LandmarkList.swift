//
//  LandmarkList.swift
//  LandMark
//
//  Created by Hitesh Agarwal on 05/01/20.
//  Copyright © 2020 Hitesh Agarwal. All rights reserved.
//

import SwiftUI

struct LandmarkList: View {
    
    @EnvironmentObject var userData: UserData
    var body: some View {
        List {
            Toggle(isOn: $userData.showFavoritesOnly) {
                Text("Show Favourite only")
            }
            ForEach(userData.landmarks) { landmark in
                if !self.userData.showFavoritesOnly || landmark.isFavorite {
                    NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                        LandmarkRow(landMark: landmark)
                    }
                }
            }
        }
        .navigationBarTitle(Text("Landmarks"))
    }
}

struct LandmarkList_Previews: PreviewProvider {
    static var previews: some View {
        LandmarkList().environmentObject(UserData())
    }
}
