//
//  MovieModel.swift
//  Movie
//
//  Created by Hitesh Agarwal on 05/02/20.
//  Copyright © 2020 Hitesh Agarwal. All rights reserved.
//
  
// MARK: - Welcome
struct MovieResponse: Codable {
    let page, totalResults, totalPages: Int
    let results: [MovieModel]

    enum CodingKeys: String, CodingKey {
        case page
        case totalResults = "total_results"
        case totalPages = "total_pages"
        case results
    }
}

// MARK: - Result
struct MovieModel: Codable {
    var popularity: Double?
    var voteCount: Int?
    var video: Bool?
    var posterPath: String?
    var id: Int?
    var adult: Bool?
    var backdropPath: String?
//    var originalLanguage: OriginalLanguage?
    var originalTitle: String?
    var genreIDS: [Int]?
    var title: String?
    var voteAverage: Double?
    var overview, releaseDate: String?

    enum CodingKeys: String, CodingKey {
        case popularity
        case voteCount = "vote_count"
        case video
        case posterPath = "poster_path"
        case id, adult
        case backdropPath = "backdrop_path"
//        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case genreIDS = "genre_ids"
        case title
        case voteAverage = "vote_average"
        case overview
        case releaseDate = "release_date"
    }
    
    init() {}
}

enum OriginalLanguage: String, Codable {
    case cn = "cn"
    case en = "en"
    case ko = "ko"
}
