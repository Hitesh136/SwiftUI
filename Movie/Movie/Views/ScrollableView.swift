//
//  ScrollableView.swift
//  Movie
//
//  Created by Hitesh Agarwal on 04/02/20.
//  Copyright © 2020 Hitesh Agarwal. All rights reserved.
//

import SwiftUI

struct ScrollableView: View {
    
    @Binding var selectedType: MovieTab
    
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(MovieTab.allCases, id: \.self) { movieType in
                    HStack(spacing: 10) {
                        if self.selectedType.rawValue == movieType.rawValue {
                            Text(movieType.description)
                                .fontWeight(.heavy)
                                .font(Font.system(size: 18))
                                .fixedSize()
                                .padding(.horizontal, 5)
                                .padding(.vertical, 2)
                                .foregroundColor(.white)
                                .background(Color.steam_gold)
                                .cornerRadius(10)
                        } else {
                            Text(movieType.description)
                                .foregroundColor(.black)
                                .fontWeight(.bold)
                            
                        }
                    }.onTapGesture {
                        self.selectedType = movieType
                    }
                }
            }
            .padding(5)
        }
        .frame(height: 36)
        .background(Color.steam_background)
        .cornerRadius(10)
    }
}


struct ScrollableView_Previews: PreviewProvider {
    @State static var movieType = MovieTab.nowPlaying
    static var previews: some View {
        ScrollableView(selectedType: $movieType)
    }
}
