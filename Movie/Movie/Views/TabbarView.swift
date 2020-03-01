//
//  TabbarView.swift
//  Movie
//
//  Created by Hitesh Agarwal on 03/02/20.
//  Copyright © 2020 Hitesh Agarwal. All rights reserved.
//

import SwiftUI

struct TabbarView: View {
    
    @State var selectedTab = Tab.movies
    
    enum Tab: Int {
        case movies, discover, fanClub, myList
    }
    
    func tabBarItem(title: String, tabImage: String) -> some View {
        VStack {
            Image(systemName: tabImage)
            Text(title)
        }
    }
    var body: some View {
        TabView(selection: $selectedTab) {
            MovieView().tabItem {
                tabBarItem(title: "Movies", tabImage: "film")
            }.tag(Tab.movies)
            
            DiscoverView().tabItem {
                tabBarItem(title: "Discover", tabImage: "square.stack")
            }.tag(Tab.discover)
            
            FanClubView().tabItem {
                tabBarItem(title: "FanClub", tabImage: "star.circle.fill")
            }.tag(Tab.fanClub)
            
            MyListView().tabItem {
                tabBarItem(title: "My Lists", tabImage: "heart.circle")
            }.tag(Tab.myList)
        }
    }
}

struct TabbarView_Previews: PreviewProvider {
    static var previews: some View {
        TabbarView()
    }
}
