//
//  UserData.swift
//  Landmarks
//
//  Created by Hitesh  Agarwal on 27/08/19.
//  Copyright © 2019 Hitesh  Agarwal. All rights reserved.
//

import SwiftUI
import Combine

class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
}
