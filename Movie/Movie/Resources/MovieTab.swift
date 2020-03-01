//
//  MovieTab.swift
//  Movie
//
//  Created by Hitesh Agarwal on 06/02/20.
//  Copyright © 2020 Hitesh Agarwal. All rights reserved.
//

import Foundation

class MoiveSelection: ObservableObject {
    @Published var selectedMovie: MovieTab
    
    init(selectedMovie: MovieTab) {
        self.selectedMovie = selectedMovie
    }
}

enum MovieTab: Int, CaseIterable {
    var id: String {
        return description
    }
    
    case nowPlaying
    case upcoming
    case trending
    case popular
    case topRated
    case genre
    
    var description: String {
        switch self {
        case .nowPlaying:
            return "Now Playing"
        case .upcoming:
            return "Upcoming"
        case .trending:
            return "Trending"
        case .popular:
            return "Popular"
        case .topRated:
            return "Top Rated"
        case .genre:
            return "Genres"
        }
    }
    
    var apiKey: String {
        switch self {
        case .nowPlaying:
            return "movie/now_playing"
        case .upcoming:
            return "movie/upcoming"
        case .trending:
            return "trending/movie/day"
        case .popular:
            return "movie/popular"
        case .topRated:
            return "movie/top_rated"
        case .genre:
            return "genre/movie/list"
        }
    }
}
