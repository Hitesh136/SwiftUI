//
//  ContentView.swift
//  HUDs
//
//  Created by Hitesh Agarwal on 07/08/20.
//  Copyright © 2020 Hitesh. All rights reserved.
//

import SwiftUI



struct ContentView: View {
    
    @State private var showHUD = false
    
    var body: some View {
        ZStack(alignment: .top) {
            NavigationView {
                Button(action: {
                    self.showHUD.toggle()
                    self.dismissHudAfterTime()
                }) {
                    VStack {
                        Image("romance")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 300) 
                    }
                }
                .navigationBarTitle("Content View")
            }
            HUD()
                .offset(y: showHUD ? 0 : -100)
                .animation(.easeOut)
        }
    }
    
    func dismissHudAfterTime() {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            self.showHUD = false
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}


struct HUD: View {
    var body: some View {
        HStack(alignment: .center) {
            Image(systemName: "photo")
                .foregroundColor(Color(.black).opacity(0.22))
                .padding(.leading, 14)
                .padding(.vertical, 14)
            Text("Saved image")
                .foregroundColor(.gray)
                .padding(.trailing, 14)
                .padding(.vertical, 14)
        }.background(
            Blur(style: .systemMaterial)
                                   .clipShape(Capsule())
                                   .shadow(color: Color(.black).opacity(0.22), radius: 12, x: 0, y: 5)
        )
    }
}

struct Blur: UIViewRepresentable {
    var style: UIBlurEffect.Style
    
    func makeUIView(context: Context) -> UIVisualEffectView {
        return UIVisualEffectView(effect: UIBlurEffect(style: style))
    }
    
    func updateUIView(_ uiView: UIVisualEffectView, context: Context) {
        uiView.effect = UIBlurEffect(style: style)
    }
}
