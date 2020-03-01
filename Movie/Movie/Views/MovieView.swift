//
//  MovieView.swift
//  Movie
//
//  Created by Hitesh Agarwal on 03/02/20.
//  Copyright © 2020 Hitesh Agarwal. All rights reserved.
//

import SwiftUI

struct MovieView: View {
    
    @State private var homeMode = HomeMode.list
    @State private var showSetting = false
    @ObservedObject private var viewModel = MovieHomeViewModel()
    
    var body: some View {
        NavigationView {
            List {
                SearchView(searchText: $viewModel.searchText)
                ScrollableView(selectedType: $viewModel.selecteMovieType)
                ForEach(viewModel.cellViewModels, id: \.self) { movieCellViewModel in
                    MovieCell(movieCellViewModel: movieCellViewModel)
                }
            }
            .navigationBarTitle(viewModel.selecteMovieType.description)
            .navigationBarItems(trailing:
            HStack {
                swapListModeButton
                settingButton
            })
        } 
    }
}

extension MovieView {
    enum HomeMode {
        case list, grid
        
        var buttonImage: Image {
            switch self {
            case .list:
                return Image(systemName: "rectangle.3.offgrid.fill")
            case .grid:
                return Image(systemName: "rectangle.grid.1x2")
            }
        }
        
        mutating func toggle() {
            self = (self == .list ? .grid : .list)
        }
    }
    
    var swapListModeButton: some View {
        Button(action: {
            self.homeMode.toggle()
        }) {
            self.homeMode.buttonImage
                .imageScale(.medium)
                .foregroundColor(.steam_gold)
                .frame(width: 30, height: 30)
        }
    }
    
    var settingButton: some View {
        Button(action: {
            self.showSetting = true
        }) {
            Image(systemName: "wrench")
                .foregroundColor(.steam_gold)
                .imageScale(.medium)
                .frame(width: 30, height: 30)
        }
    }
}

struct MovieView_Previews: PreviewProvider {
    static var previews: some View {
        MovieView()
    }
}
