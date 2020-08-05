//
//  ContentView.swift
//  AlternateAppIcons
//
//  Created by Hitesh Agarwal on 01/03/20.
//  Copyright © 2020 Hitesh Agarwal. All rights reserved.
//

import SwiftUI

struct ContentView: View {
    
    @EnvironmentObject var iconSetting: IconNames
    
    var body: some View {
        NavigationView {
            Form {
                Section {
                    Picker(selection: $iconSetting.currentIndex, label: Text("Icons")) {
                        ForEach(0..<self.iconSetting.iconNames.count) { i in
                            HStack {
                                
//                                Text("ss")
                                Text(self.iconSetting.iconNames[i] ?? "Default")
                                
                                Image(uiImage: UIImage(named: self.iconSetting.iconNames[i] ?? "AppIcon") ?? UIImage())
                                    .resizable()
                                    .frame(width: 50, height: 50)
                            }
                        }
                    }.onReceive([self.iconSetting.currentIndex].publisher) { (value) in
                        
                        UIApplication.shared.setAlternateIconName(self.iconSetting.iconNames[value]) { error in
                            
                            if let error = error {
                                print(error.localizedDescription)
                            } else {
                                print("Success")
                            }
                        }
                    }
                }
            }
            .navigationBarTitle("Icons")
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
