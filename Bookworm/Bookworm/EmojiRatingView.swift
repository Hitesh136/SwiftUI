//
//  EmojiRatingView.swift
//  Bookworm
//
//  Created by Hitesh Agarwal on 24/01/20.
//  Copyright © 2020 Hitesh Agarwal. All rights reserved.
//

import SwiftUI

struct EmojiRatingView: View {
    
    let rating: Int
    var body: some View {
        switch rating {
        case 1:
            return Text("😢")
        case 2:
            return Text("😕")
        case 3:
            return Text("🙂")
        case 4:
            return Text("😀")
        default:
            return Text("😆")
        }
    }
}

struct EmojiRatingView_Previews: PreviewProvider {
    static var previews: some View {
        EmojiRatingView(rating: 3)
    }
}
