//
//  MovieCellViewModel.swift
//  Movie
//
//  Created by Hitesh Agarwal on 05/02/20.
//  Copyright © 2020 Hitesh Agarwal. All rights reserved.
//

import Foundation

class MovieCellViewModel {
    private var movie: MovieModel?
    
    init(movie: MovieModel) {
        self.movie = movie
    }
}

extension MovieCellViewModel {
    var movieImageName: String {
        if let posterPath = movie?.posterPath {
            return "\(APIPath.imageBaseURL.rawValue)\(posterPath)"
        }
        return ""
    }
    
    var movieTitle: String {
        movie?.title ?? "--"
    }
    
    var voteAverage: Int {
        Int((movie?.voteAverage ?? 0) * 10)
    }
    
    var overview: String {
        movie?.overview ?? "--"
    }
    
    var releaseDate: String {
        movie?.releaseDate ?? "NA"
    }
}

extension MovieCellViewModel: Hashable {
    static func == (lhs: MovieCellViewModel, rhs: MovieCellViewModel) -> Bool {
        lhs.movie?.id == rhs.movie?.id
    }
    
    func hash(into hasher: inout Hasher) {
        hasher.combine(movie?.id)
    }
}
