//
//  ViewModifier.swift
//  swiftuiAdvancedLearning
//
//  Created by MacBook on 18/11/2024.
//

import SwiftUI

struct btnModifier : ViewModifier {
    
    let backgroundColor : Color
    
    func body(content: Content) -> some View {
        content
            .foregroundColor(.white)
            .frame(height: 55)
            .frame(maxWidth: .infinity)
            .background(backgroundColor)
            .cornerRadius(10)
            .shadow(radius: 10)
    }
}

extension View {
    func withDefaultBtnFormat(backgroundColor : Color = .blue) -> some View {
        self.modifier(btnModifier(backgroundColor: backgroundColor))
    }
}

struct ViewModifierScreen: View {
    var body: some View {
        VStack(spacing: 16.0) {
            Text("Hello, World!")
                .font(.headline)
                .modifier(btnModifier(backgroundColor: .blue))
            
            Text("Hello, World!")
                .font(.subheadline)
                .withDefaultBtnFormat()
            
            Text("Hello, World!")
                .font(.title)
                .modifier(btnModifier(backgroundColor: .pink))
        }
        .padding()
    }
}

#Preview {
    ViewModifierScreen()
}
