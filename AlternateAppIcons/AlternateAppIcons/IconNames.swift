//
//  IconNames.swift
//  AlternateAppIcons
//
//  Created by Hitesh Agarwal on 01/03/20.
//  Copyright © 2020 Hitesh Agarwal. All rights reserved.
//

import Foundation
import UIKit

class IconNames: ObservableObject {
    var iconNames = [String?]()
    @Published var currentIndex = 0
    
    init() {
        getAlternateIconNames()
        
        if let currentIcon = UIApplication.shared.alternateIconName{
            self.currentIndex = iconNames.firstIndex(of: currentIcon) ?? 0
        }
    }
    
    func getAlternateIconNames(){
        iconNames.append(nil)
        if let icons = Bundle.main.object(forInfoDictionaryKey: "CFBundleIcons") as? [String: Any] {
            
            if let alternateIcons = icons["CFBundleAlternateIcons"] as? [String: Any] {
                
                for (_, value) in alternateIcons{
                    
                    guard let iconList = value as? Dictionary<String,Any> else{return}
                    guard let iconFiles = iconList["CFBundleIconFiles"] as? [String]
                        else{return}
                    
                    guard let icon = iconFiles.first else{return}
                    iconNames.append(icon)
                    
                }
            }
        }
    }
}

