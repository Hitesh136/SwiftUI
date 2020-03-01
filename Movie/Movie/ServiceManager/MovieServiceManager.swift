//
//  MovieServiceManager.swift
//  Movie
//
//  Created by Hitesh Agarwal on 05/02/20.
//  Copyright © 2020 Hitesh Agarwal. All rights reserved.
//

import Foundation


class MovieServiceManager {
    
    func fetchAllMovies(withApiString apiPath: String,
                       completion: @escaping (Result<[MovieModel], Error>) -> ()) {
        
        let userServiceRequest = ServiceHandler<MovieResponse>()
        let parameters: [String: Any] = [
            "language" : "en-US",
            "sort_by" : "popularity.desc",
            "include_adult": false,
            "include_video": false,
            "page": 1,
        ]
        
        let _apiPath = String(format: APIPath.discover.rawValue, apiPath)
        userServiceRequest.request(url: _apiPath, method: .get, paramters: parameters) { (result) in
            
            switch result {
                case .success(let decodedObject):
                    completion(.success(decodedObject.results))
                case .failure(let error):
                    completion(.failure(error))
            }
        }
    }
}
