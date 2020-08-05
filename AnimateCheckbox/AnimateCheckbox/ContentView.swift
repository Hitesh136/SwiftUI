//
//  ContentView.swift
//  AnimateCheckbox
//
//  Created by Hitesh Agarwal on 05/08/20.
//  Copyright © 2020 Hitesh. All rights reserved.
//

import SwiftUI
//https://medium.com/better-programming/how-to-create-and-animate-checkboxes-in-swiftui-e428fe7cc9c1

struct ContentView: View {
    
    @State var isChecked: Bool
    @State var trimValue: CGFloat = 0
    var body: some View {
         
        CheckBoxView(isChecked: $isChecked, trimValue: $trimValue)
            .onTapGesture {
                if !self.isChecked {
                    withAnimation(Animation.easeIn(duration: 0.8)) {
                        self.trimValue = 1
                        self.isChecked.toggle()
                    }
                } else {
                    withAnimation(Animation.easeIn(duration: 0.8)) {
                        self.trimValue = 0
                        self.isChecked.toggle()
                    }
                }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView(isChecked: true)
    }
}


