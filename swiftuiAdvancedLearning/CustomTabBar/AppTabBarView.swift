//
//  AppTabBarView.swift
//  swiftuiAdvancedLearning
//
//  Created by MacBook on 22/11/2024.
//

import SwiftUI

struct AppTabBarView: View {
    
    @State private var selection: String = "home"
    
    var body: some View {
        TabView(selection: $selection) {
            Color.red
                .tabItem {
                    Image(systemName: "house")
                    Text("Home")
                }
            
            Color.blue
                .tabItem {
                    Image(systemName: "heart")
                    Text("Favorites")
                }
            
            Color.orange
                .tabItem {
                    Image(systemName: "person")
                    Text("Profile")
                }
        }
    }
}

#Preview {
    AppTabBarView()
}
