//
//  CustomTabBarView.swift
//  swiftuiAdvancedLearning
//
//  Created by MacBook on 22/11/2024.
//

import SwiftUI

struct CustomTabBarView: View {
    
    let tabs: [TabBarItem]
    @Binding var selectedItem: TabBarItem

    @Namespace var nameSpace
//        .matchedGeometryEffect(id: "tabBarItem", in: nameSpace)
    
    var body: some View {
        HStack {
            ForEach(tabs, id: \.self) { item in
                tabBarItem(item: item)
                    
            }
        }
        .padding(6)
        .background(Color.white)
        .ignoresSafeArea()
    }
}

#Preview {
    
    VStack {
        
        let tabs: [TabBarItem] = [
            TabBarItem(iconName: "house", title: "Home", color: .red),
            TabBarItem(iconName: "heart", title: "Favorites", color: .blue),
            TabBarItem(iconName: "person", title: "Profile", color: .green)
        ]
        Spacer()
        
        CustomTabBarView(tabs: tabs, selectedItem: .constant(tabs.first!))
    }
}

extension CustomTabBarView {
    
    private func tabBarItem(item: TabBarItem) -> some View {
        VStack {
            Image(systemName: item.iconName)
                .font(.headline)
            
            Text(item.title)
                .font(.system(size: 10, weight: .semibold, design: .rounded))
        }
        .padding(.vertical, 8)
        .frame(maxWidth: .infinity)
        .foregroundColor(selectedItem == item ? item.color : .gray)
        .background(
            RoundedRectangle(cornerRadius: 10)
                .fill(selectedItem == item ? item.color.opacity(0.3) : Color.clear)
                
            
        )
//        .cornerRadius(10)
        .onTapGesture {
            withAnimation(.easeInOut) {
                selectedItem = item
            }
        }
    }
}

struct TabBarItem: Hashable {
    let iconName: String
    let title: String
    let color: Color
}
