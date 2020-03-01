//
//  MovieCell.swift
//  Movie
//
//  Created by Hitesh Agarwal on 03/02/20.
//  Copyright © 2020 Hitesh Agarwal. All rights reserved.
//

import SwiftUI
import SDWebImageSwiftUI

struct MovieCell: View {
    var movieCellViewModel: MovieCellViewModel
    var body: some View {
        HStack(alignment: .center) {
            WebImage(url: URL(string: movieCellViewModel.movieImageName))
            .onSuccess { image, cacheType in
                // Success
            }
            .resizable()
            .placeholder(Image(systemName: "photo"))
            .indicator(.activity)  
            .animation(.easeInOut(duration: 0.5)) // Animation Duration
            .transition(.fade)
            .scaledToFit()
            .cornerRadius(5)
            .frame(width: 120, height: 170, alignment: .center)
            .shadow(radius: 10)
            .padding(.top, 8)
            .padding(.bottom, 8)
            .padding(.leading, 4)

            VStack(alignment: .leading, spacing: 8) {
                Text(movieCellViewModel.movieTitle)
                    .foregroundColor(.steam_gold)
                    .titleStyle()
                
                HStack {
                    PopularityBadge(score: movieCellViewModel.voteAverage, isDisplayed: true)
                    Text(movieCellViewModel.releaseDate)
                        .font(.subheadline)
                        .foregroundColor(.primary)
                    .lineLimit(1)
                }
                Text(movieCellViewModel.overview)
                    .foregroundColor(.secondary)
                    .lineLimit(3)
                    .truncationMode(.tail)
                    
            }
            
            .padding(.leading, 8)
        }
    }
}

struct MovieCell_Previews: PreviewProvider {
    static var previews: some View {
        
        var movieModel1 = MovieModel()
        movieModel1.posterPath = "/xBHvZcjRiWyobQ9kxBhO6B2dtRI.jpg"
        movieModel1.title = "Ad Astra"
        movieModel1.releaseDate = "2019-09-17"
        movieModel1.overview = "The near future, a time when both hope and hardships drive humanity to look to the stars and beyond. While a mysterious phenomenon menaces to destroy life on planet Earth, astronaut Roy McBride undertakes a mission across the immensity of space and its many perils to uncover the truth about a lost expedition that decades before boldly faced emptiness and silence in search of the unknown."
        movieModel1.voteAverage = 6

        let movieCellViewModel1 = MovieCellViewModel(movie: movieModel1)
        return MovieCell(movieCellViewModel: movieCellViewModel1)
    }
}
