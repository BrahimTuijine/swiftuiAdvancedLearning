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
       
    @Namespace private var nameSpace
    
    var body: some View {
        tabBarVersion2
    }
}



private let tabs: [TabBarItem] = [
    .home, .favorites, .profile
]

#Preview {
    
    VStack {
        Spacer()
        CustomTabBarView(tabs: tabs, selectedItem: .constant(tabs.first!))
    }
}

extension CustomTabBarView {
    
    private func tabBarView(item: TabBarItem) -> some View {
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
        .onTapGesture {
            withAnimation(.easeInOut) {
                selectedItem = item
            }
        }
    }
    
    private var tabBarVersion1 : some View {
        HStack {
            ForEach(tabs, id: \.self) { item in
                tabBarView(item: item)
            }
        }
        .padding(6)
        .background(Color.white)
        .ignoresSafeArea()
    }
    
    private func tabBarView2(item: TabBarItem) -> some View {
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
            ZStack {
                if selectedItem == item {
                    RoundedRectangle(cornerRadius: 10)
                        .fill(item.color.opacity(0.2))
                        .matchedGeometryEffect(id: "tabBarItem", in: nameSpace)
                }
            }

        )
        .onTapGesture {
            withAnimation(.easeInOut) {
                selectedItem = item
            }
        }
    }
    
    private var tabBarVersion2: some View {
        HStack {
            ForEach(tabs, id: \.self) { item in
                tabBarView2(item: item)
                    
            }
        }
        .padding(6)
        .background(Color.white.ignoresSafeArea(edges: .bottom))
        .cornerRadius(10)
        .shadow(color: Color.black.opacity(0.3), radius: 10, x:0, y: 5)
        .padding(.horizontal)
    }
     
}

