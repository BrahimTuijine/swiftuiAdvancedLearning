//
//  ButtonStyleScreen.swift
//  swiftuiAdvancedLearning
//
//  Created by MacBook on 18/11/2024.
//

import SwiftUI

struct PressableBtnStyle : ButtonStyle {
    
    let scale: Double
    
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .scaleEffect(configuration.isPressed ? scale : 1)
//            .opacity(configuration.isPressed ? 0.3 : 1)
    }
}

extension View {
    func withPressableStyle(scale: Double = 0.94) -> some View {
        self.buttonStyle(PressableBtnStyle(scale: scale))
    }
}


struct ButtonStyleScreen: View {
    var body: some View {
        Button(action: {
            print("button clicked")
        }, label: {
            Text("Button")
                .font(.headline)
                .withDefaultBtnFormat()
        })
        .withPressableStyle(scale: 1.1)
//        .withPressableStyle()
        .padding()
    }
}

#Preview {
    ButtonStyleScreen()
}
