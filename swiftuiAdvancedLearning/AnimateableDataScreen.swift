//
//  AnimateableDataScreen.swift
//  swiftuiAdvancedLearning
//
//  Created by MacBook on 20/11/2024.
//

import SwiftUI

struct AnimateableDataScreen: View {
    
    @State private var animate: Bool = false
    
    var body: some View {
        ZStack {
//            RectangleWithSingleCorner(cornerRaduis: animate ? 60 : 0)
            Packman(offsetAmount: animate ? 20 : 0)
                .fill(Color.yellow)
                .frame(width: 300, height: 300)
        }
        .onAppear {
            withAnimation(.easeInOut.repeatForever()) {
                animate.toggle()
            }
        }
    }
}

struct RectangleWithSingleCorner : Shape {
    
    var cornerRaduis : CGFloat
    
    var animatableData: CGFloat {
        get { cornerRaduis}
        set { cornerRaduis = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: .zero)
            
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY - cornerRaduis))
            
            path.addArc(
                center: CGPoint(x: rect.maxX - cornerRaduis, y: rect.maxY - cornerRaduis),
                radius: cornerRaduis,
                startAngle: .degrees(0),
                endAngle: .degrees(360),
                clockwise: false)
            
            path.addLine(to: CGPoint(x: rect.maxX - cornerRaduis , y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }
    }
}

#Preview {
    AnimateableDataScreen()
}


struct Packman : Shape {
    
    var offsetAmount : CGFloat
    
    var animatableData: CGFloat {
        get { offsetAmount }
        set { offsetAmount = newValue }
    }
    
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.midY))
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY),
                radius: rect.width / 2 ,
                startAngle: .degrees(offsetAmount),
                endAngle: .degrees(360 - offsetAmount),
                clockwise: false)
        }
    }
}
