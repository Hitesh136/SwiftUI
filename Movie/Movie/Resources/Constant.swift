//
//  Constant.swift
//  Movie
//
//  Created by Hitesh Agarwal on 05/02/20.
//  Copyright © 2020 Hitesh Agarwal. All rights reserved.
//

import Foundation

let apiKey = "c5b2e267c7eefe828ba2e1042749bba7"

enum APIPath: String {
    case baseURL = "https://api.themoviedb.org/"
    case discover = "3/%@"
    case imageBaseURL = "https://image.tmdb.org/t/p/w200/"
}
