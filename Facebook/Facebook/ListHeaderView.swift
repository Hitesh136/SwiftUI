//
//  ListHeaderView.swift
//  Facebook
//
//  Created by Hitesh Agarwal on 02/02/20.
//  Copyright © 2020 Hitesh Agarwal. All rights reserved.
//

import SwiftUI
 
struct ListHeaderView: View {
    
    var trandings:[String]
    var body: some View {
        VStack(alignment: .leading) {
            Text("Trending")
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(trandings, id: \.self) { tranding in
                        TrandingCell(imageName: "Romance",
                                     title: "It is a vary nice red rose ")
                            .frame(width: 100, height: 150)
                    }
                }
            }
        }
    }
}

struct TrandingCell: View {
    
    var imageName: String
    var title: String
    var body: some View {
        GeometryReader { geomatry in
            VStack {
                Image(self.imageName)
                    .resizable()
                    .cornerRadius(10)
                Text(self.title)
                    .lineLimit(2)
                    .multilineTextAlignment(.leading)
                    .font(Font.system(size: 12))
            }
        }
    }
}

struct ListHeaderView_Previews: PreviewProvider {
    static var previews: some View {
        ListHeaderView(trandings: ["Tranding"])
    }
}
