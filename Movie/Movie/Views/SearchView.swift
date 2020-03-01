//
//  SearchView.swift
//  Movie
//
//  Created by Hitesh Agarwal on 03/02/20.
//  Copyright © 2020 Hitesh Agarwal. All rights reserved.
//

import SwiftUI


struct SearchView: View {
    
    @Binding var searchText: String
    
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: "magnifyingglass")
            TextField("Search any movies or person", text: $searchText)
                .textFieldStyle(RoundedBorderTextFieldStyle())
            .disableAutocorrection(true)
                .padding(.leading, 5)
            
            if !searchText.isEmpty {
                Button(action: {
                    
                }) {
                    Text("Cancel")
                        .foregroundColor(.steam_blue)
                }.animation(.easeInOut)
            }
        }
    }
}
struct SearchView_Previews: PreviewProvider {
    @State static var searchText = ""
    static var previews: some View {
        SearchView(searchText: $searchText)
    }
}
