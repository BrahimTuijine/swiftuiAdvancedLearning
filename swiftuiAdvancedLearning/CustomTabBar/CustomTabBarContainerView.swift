//
//  CustomTabBarContainerView.swift
//  swiftuiAdvancedLearning
//
//  Created by MacBook on 22/11/2024.
//

import SwiftUI

struct CustomTabBarContainerView<Content: View>: View {
    
    let content: Content
    @Binding var selection: TabBarItem
    @State private var tabs: [TabBarItem] = []
    
    init(selection: Binding<TabBarItem>, @ViewBuilder content: () -> Content){
        self._selection = selection
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0) {
            ZStack {
                content
            }
            CustomTabBarView(tabs: tabs, selectedItem: $selection)
        }
        .onPreferenceChange(TabBarItemsPreferenceKey.self, perform: { value in
            tabs = value
        })
    }
}

private let tabs: [TabBarItem] = [
    .home , .favorites, .profile, 
]

#Preview {
    CustomTabBarContainerView(selection: .constant(tabs.first!)) {
        Color.red
    }
}
