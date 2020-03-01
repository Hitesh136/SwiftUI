//
//  RatingView.swift
//  Bookworm
//
//  Created by Hitesh Agarwal on 24/01/20.
//  Copyright © 2020 Hitesh Agarwal. All rights reserved.
//

import SwiftUI

struct RatingView: View {
    
    @Binding var rating: Int
    var maxRating = 5
    var starImage = Image(systemName: "star.fill")
    let offColor = Color.gray
    let onColor = Color.yellow
    
    var body: some View {
        
        HStack {
            ForEach(1...5, id: \.self) { number in
                self.starImage
                    .foregroundColor(number > self.rating ? self.offColor : self.onColor)
                    .onTapGesture {
                        self.rating = number
                    }
            }
        }
    }
}

struct RatingView_Previews: PreviewProvider {
    static var previews: some View {
        RatingView(rating: .constant(3))
    }
}
