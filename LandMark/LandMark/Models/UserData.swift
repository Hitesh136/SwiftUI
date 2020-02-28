//
//  UserData.swift
//  LandMark
//
//  Created by Hitesh Agarwal on 05/01/20.
//  Copyright © 2020 Hitesh Agarwal. All rights reserved.
//

import Foundation
import Combine

final class UserData: ObservableObject {
    @Published var showFavoritesOnly = false
    @Published var landmarks = landmarkData
    @Published var profile = Profile.default
}
