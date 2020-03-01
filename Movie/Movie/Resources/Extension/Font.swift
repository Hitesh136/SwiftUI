//
//  Font.swift
//  Movie
//
//  Created by Hitesh Agarwal on 03/02/20.
//  Copyright © 2020 Hitesh Agarwal. All rights reserved.
//

import Foundation
import SwiftUI

extension Font {
    public static func FHACondFrenchNC(size: CGFloat) -> Font {
        return Font.custom("FHA Condensed French NC", size: size)
    }
    
    public static func AmericanCaptain(size: CGFloat) -> Font {
        return Font.custom("American Captain", size: size)
    }
    
    public static func FjallaOne(size: CGFloat) -> Font {
        return Font.custom("FjallaOne-Regular", size: size)
    }
}

struct TitleFont: ViewModifier {
    let size: CGFloat
    
    func body(content: Content) -> some View {
        return content.font(.FjallaOne(size: size))
    }
}

extension View {
    func titleStyle() -> some View {
        return ModifiedContent(content: self, modifier: TitleFont(size: 16))
    }
}
