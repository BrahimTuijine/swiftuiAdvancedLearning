//
//  TabBarItemsPreferenceKey.swift
//  swiftuiAdvancedLearning
//
//  Created by MacBook on 24/11/2024.
//

import Foundation
import SwiftUI

struct TabBarItemsPreferenceKey : PreferenceKey {
    static var defaultValue: [TabBarItem] = []
    
    static func reduce(value: inout [TabBarItem], nextValue: () -> [TabBarItem]) {
        value += nextValue()
    }
}


struct TabBarItemViewModifier: ViewModifier {
    
    let tab : TabBarItem
    @Binding var selection: TabBarItem
    
    func body(content: Content) -> some View {
        content
            .opacity(selection == tab ? 1 : 0)
            .preference(key: TabBarItemsPreferenceKey.self, value: [tab])
    }
}

extension View {
    func tabBarItem(item: TabBarItem, selction: Binding<TabBarItem>) -> some View {
        self.modifier(TabBarItemViewModifier(tab: item, selection: selction))
    }
}
