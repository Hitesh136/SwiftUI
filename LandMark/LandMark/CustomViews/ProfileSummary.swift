//
//  ProfileSummary.swift
//  LandMark
//
//  Created by Hitesh Agarwal on 19/01/20.
//  Copyright © 2020 Hitesh Agarwal. All rights reserved.
//

import SwiftUI

struct ProfileSummary: View {
    
   var profile: Profile
    @State var showEditProfile = false
    var dateFormatter: DateFormatter {
        let dateFormatter = DateFormatter()
        dateFormatter.dateStyle = .long
        dateFormatter.timeStyle = .none
        return dateFormatter
    }
    var body: some View {
        
        List {
            Text(profile.username)
                .font(.title)
                .bold() 
            
            Text("Notifications: \(self.profile.prefersNotifications ? "On" : "Off")")
            Text("Seasonal photos: \(self.profile.seasonalPhoto.rawValue)")
            Text("Goal Date: \(self.profile.goalDate, formatter: dateFormatter)")
            
            VStack(alignment: .leading) {
                Text("Completed Badges")
                    .font(.headline)
                
                ScrollView {
                    HStack {
                        HIkeBadge(name: "First Hike")
                        
                        HIkeBadge(name: "Earth Day")
                            .hueRotation(Angle(degrees: 90))
                        
                        HIkeBadge(name: "Tenth Hike")
                            .grayscale(0.5)
                            .hueRotation(Angle(degrees: 45))
                    }
                }
                .frame(height: 140)
            }
            
            VStack(alignment: .leading) {
                Text("Recents Hikes").font(.headline)
                HikeView(hike: hikeData[0])
            }
        }
        .sheet(isPresented: $showEditProfile) {
            ProfileEditor(profile: .constant(.default))
        }
    }
}

struct ProfileSummary_Previews: PreviewProvider {
    static var previews: some View {
        ProfileSummary(profile: Profile.default)
    }
}
