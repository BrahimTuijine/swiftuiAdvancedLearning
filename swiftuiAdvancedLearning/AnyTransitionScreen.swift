//
//  AnyTransitionScreen.swift
//  swiftuiAdvancedLearning
//
//  Created by MacBook on 19/11/2024.
//

import SwiftUI

struct RotateViewModifier: ViewModifier {
    
    let degrees : Double

    func body(content: Content) -> some View {
        content
            .rotationEffect(.degrees(degrees))
            .offset(
                x: degrees != 0 ? UIScreen.main.bounds.width : 0,
                y: degrees != 0 ? UIScreen.main.bounds.height : 0
            )
    }
}

extension AnyTransition {
    static var rotating: AnyTransition {
        return AnyTransition.modifier(
            active: RotateViewModifier(degrees: 180),
            identity: RotateViewModifier(degrees: 0)
        )
    }
    
    static func rotating(degree: Double) -> AnyTransition {
        return AnyTransition.modifier(
            active: RotateViewModifier(degrees: degree),
            identity: RotateViewModifier(degrees: 0)
        )
    }
    
    static var rotateOn: AnyTransition {
        return AnyTransition.asymmetric(
            insertion: rotating,
            removal: .move(edge: .leading)
        )
    }
    
}

struct AnyTransitionScreen: View {
    
    @State private var showRectangle: Bool = false
    
    var body: some View {
        VStack {
            Spacer()
            
            
            if showRectangle {
                RoundedRectangle(cornerRadius: 25)
                    .frame(width: 250, height: 350)
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .transition(.rotateOn)
            }
            
            
            Spacer()
            
            Text("click me")
                .withDefaultBtnFormat()
                .padding()
                .onTapGesture {
                    withAnimation(.easeInOut) {
                        showRectangle.toggle()
                    }
                }
        }
    }
}

#Preview {
    AnyTransitionScreen()
}
