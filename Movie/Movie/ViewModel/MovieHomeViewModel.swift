//
//  MovieViewModel.swift
//  Movie
//
//  Created by Hitesh Agarwal on 05/02/20.
//  Copyright © 2020 Hitesh Agarwal. All rights reserved.
//

import Foundation
import Combine

class MovieHomeViewModel: ObservableObject {
    
    @Published var cellViewModels = [MovieCellViewModel]()
    var tempCellViewModels = [MovieCellViewModel]()
    @Published var selecteMovieType = MovieTab.nowPlaying
    @Published var searchText = ""
    var selectedMoivePublisher = AnyCancellable {}
    var movieDataManager = MoviesDataManager()
    private var cancellableSet: Set<AnyCancellable> = []
    init() {
        
        selectedMoivePublisher = $selecteMovieType
            .map({ movieTav in
                movieTav.apiKey
            })
            .sink(receiveValue: fetchUsers(withApiString:))
        
        $searchText
            .dropFirst()
            .debounce(for: 0.5, scheduler: RunLoop.main)
            .sink { searchText in
                if searchText.isEmpty {
                    self.cellViewModels = self.tempCellViewModels
                } else {
                    if self.tempCellViewModels.isEmpty {
                        self.tempCellViewModels = self.cellViewModels
                    }
                    self.cellViewModels = self.tempCellViewModels.filter{ $0.movieTitle.contains(searchText) }
                }
            }
            .store(in: &cancellableSet)
    }
    
    var rowsCount: Int {
        return cellViewModels.count
    }
    
    func fetchUsers(withApiString apiPath: String) {
        movieDataManager.fetchMovies(withApiString: apiPath) { [weak self] (result) in
            guard let self = self else {
                return
            }
            switch result {
                case .success(let moviesModel):
                    self.cellViewModels = moviesModel.map{ MovieCellViewModel(movie: $0) }
                case .failure(_):
                    self.cellViewModels = []
            }
        }
    }
}
