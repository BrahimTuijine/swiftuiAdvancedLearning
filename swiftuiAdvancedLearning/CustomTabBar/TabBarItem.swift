//
//  TabBarItem.swift
//  swiftuiAdvancedLearning
//
//  Created by MacBook on 24/11/2024.
//

import Foundation
import SwiftUI



//struct TabBarItem: Hashable {
//    let iconName: String
//    let title: String
//    let color: Color
//}

enum TabBarItem: Hashable {
    case home , favorites , profile
    
    var iconName: String {
        switch self {
        case .home: return "house"
        case .favorites: return "heart"
        case.profile: return "person"
        }
    }
    
    var title: String {
        switch self {
        case .home: return "Home"
        case .favorites: return "Favorites"
        case.profile: return "Profile"
        }
    }
    
    var color: Color {
        switch self {
        case .home: return Color.blue
        case .favorites: return Color.red
        case .profile: return Color.green
        }
    }

}


//[
//    TabBarItem(iconName: "house", title: "Home", color: Color.red),
//    TabBarItem(iconName: "heart", title: "Favorites", color: Color.blue),
//    TabBarItem(iconName: "person", title: "Profile", color: Color.green)
//]
