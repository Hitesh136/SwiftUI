//
//  CatagoryRow.swift
//  LandMark
//
//  Created by Hitesh Agarwal on 19/01/20.
//  Copyright © 2020 Hitesh Agarwal. All rights reserved.
//

import SwiftUI

struct CategoryRow: View {
    
    var categoryName: String
    var landmarks: [Landmark]
    var body: some View {
//        Text(self.catagoryName).font(.headline)
        VStack(alignment: .leading) {
            Text(self.categoryName)
                .font(.headline)
                .padding(.leading, 15)
                .padding(.top, 5)
                
            ScrollView(.horizontal, showsIndicators: false) {
                HStack(alignment: .top, spacing: 0) {
                    ForEach(self.landmarks) { landmark in
                        
                        NavigationLink(destination: LandmarkDetail(landmark: landmark)) {
                            CategoryItem(landmark: landmark)
                        }
                    }
                }
            }
            .frame(height: 185)
        }
    }
}

struct CategoryRow_Previews: PreviewProvider {
    static var previews: some View {
        CategoryRow(categoryName: landmarkData[0].category.rawValue,
                    landmarks: Array(landmarkData.prefix(3)))
    }
}

