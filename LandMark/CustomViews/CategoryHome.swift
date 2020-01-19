//
//  CategoryHome.swift
//  LandMark
//
//  Created by Hitesh Agarwal on 19/01/20.
//  Copyright © 2020 Hitesh Agarwal. All rights reserved.
//

import SwiftUI

struct CategoryHome: View {
    
    var catagories: [String: [Landmark]] {
        Dictionary(grouping: landmarkData, by: { $0.category.rawValue })
    }
    @State var showingProfile = false
    var profileButton: some View {
        Button(action: { self.showingProfile.toggle() }) {
            Image(systemName: "person.crop.circle")
                .imageScale(.large)
                .accessibility(label: Text("User Image"))
//                .padding()
        }
    }
    var body: some View {
        NavigationView {
            List {
                landmarkData[0].image
                    .resizable()
                    .scaledToFill()
                    .frame(height: 200)
                    .clipped()
                    .listRowInsets(EdgeInsets())
                ForEach(catagories.keys.sorted(), id: \.self) { key in
                    CategoryRow(categoryName: key, landmarks: self.catagories[key]!)
                }
                .listRowInsets(EdgeInsets())
                
                NavigationLink(destination: LandmarkList()) {
                    Text("See all")
                }
            }
            .navigationBarTitle(Text("Featured"))
            .navigationBarItems(trailing: profileButton)
            .sheet(isPresented: $showingProfile) {
                Text("User Profile")
            }
        }
    }
}

struct CategoryHome_Previews: PreviewProvider {
    static var previews: some View {
        CategoryHome()
    }
}
