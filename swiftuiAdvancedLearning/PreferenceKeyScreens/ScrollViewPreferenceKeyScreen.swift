//
//  ScrollViewPreferenceKeyScreen.swift
//  swiftuiAdvancedLearning
//
//  Created by MacBook on 22/11/2024.
//

import SwiftUI

struct ScrollViewOffsetPreferenceKey: PreferenceKey {
    static var defaultValue: CGFloat = 0
    
    static func reduce(value: inout CGFloat, nextValue: () -> CGFloat) {
        value = nextValue()
    }
}

extension View {
    func scrollViewOffset(offset: CGFloat) -> some View {
        preference(key: ScrollViewOffsetPreferenceKey.self, value: offset)
    }
}

struct ScrollViewPreferenceKeyScreen: View {
    
    let title: String = "New title here !!!"
    
    @State private var scrollViewOffset: CGFloat = 0
    
    var body: some View {
        
        ScrollView(showsIndicators: false) {
            VStack {
                titleLayer
                    .opacity(Double(scrollViewOffset) / 75.0 //initial offset
                    )
                    .background(
                        GeometryReader { geo in
                            Text("")
                                .scrollViewOffset(offset: geo.frame(in: .global).minY)
                        }
                )
                
                
                
                contentLayer
            }
            .padding()
        }
        .overlay(Text("\(scrollViewOffset)"))
        .onPreferenceChange(ScrollViewOffsetPreferenceKey.self, perform: { value in
            withAnimation(.spring()) {
                scrollViewOffset = value
            }
        })
        .overlay(navBarLayer
            .offset(y: scrollViewOffset < 10 ? 0 : -120 ) ,alignment: .top)
        
    }
}

#Preview {
    ScrollViewPreferenceKeyScreen()
}

extension ScrollViewPreferenceKeyScreen {
    private var titleLayer: some View {
        Text(title)
            .font(.title)
            .fontWeight(.semibold)
            .frame(maxWidth: .infinity, alignment: .leading)
    }
    
    private var contentLayer: some View {
        ForEach(0..<100) { _ in
            RoundedRectangle(cornerRadius: 10)
                .fill(Color.red.opacity(0.3))
                .frame(width: 300, height: 200)
            
        }
    }
    
    private var navBarLayer: some View {
        Text(title)
            .font(.headline)
            .frame(height: 55)
        .frame(maxWidth: .infinity)
        .background(.blue)
    }
    

}
