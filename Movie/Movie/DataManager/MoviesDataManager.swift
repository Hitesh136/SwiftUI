//
//  MovieDataManager.swift
//  Movie
//
//  Created by Hitesh Agarwal on 05/02/20.
//  Copyright © 2020 Hitesh Agarwal. All rights reserved.
//

import Foundation

class MoviesDataManager {
    
    let movieServiceManager = MovieServiceManager()
//    let userDBManager = UserDBManager()
    
    func fetchMovies(withApiString apiPath: String,
                    completion: @escaping (Result<[MovieModel], Error>) -> ()) {
        
        movieServiceManager.fetchAllMovies(withApiString: apiPath) { [weak self] (result) in
            guard let _ = self else { return }
            switch result {
            case .success(let movies):
                completion(.success(movies))
            case .failure(let error):
                completion(.failure(error))
            }
        }
    }
    
}
