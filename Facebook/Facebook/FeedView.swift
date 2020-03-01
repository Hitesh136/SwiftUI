//
//  FeedView.swift
//  Facebook
//
//  Created by Hitesh Agarwal on 02/02/20.
//  Copyright © 2020 Hitesh Agarwal. All rights reserved.
//

import SwiftUI

struct FeedView: View {
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                Image("Romance")
                    .resizable()
                    .clipShape(Circle())
                    .frame(width: 50, height: 50)
                
                VStack(alignment: .leading, spacing:3) {
                    Text("Hilary Clinton")
                        .fontWeight(.semibold)
                    Text("Posted 8 hrs ago")
                }
            }
            .padding(.leading)
            .padding(.trailing)
            
            Text("Post body text that will hopefully support auto sizing vertically and span multiple lines")
                .padding(.leading)
                .padding(.trailing)
            
            Image("Fantasy")
//                .resizable(capInsets: EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0), resizingMode: .stretch)
            .resizable()
                .frame(height: 250)
            
        }
    }
}
struct FeedView_Previews: PreviewProvider {
    static var previews: some View {
        FeedView()
    }
}
