//
//  CustomShapesScreen.swift
//  swiftuiAdvancedLearning
//
//  Created by MacBook on 20/11/2024.
//

import SwiftUI

struct Triangle: Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
}

struct Diamond : Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            let horisontalOffset: CGFloat = rect.width * 0.2
            path.move(to: CGPoint(x: rect.midX, y: rect.minY))
            path.addLine(to: CGPoint(x: rect.maxX - horisontalOffset, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX + horisontalOffset, y: rect.midY))
            path.addLine(to: CGPoint(x: rect.midX, y: rect.minY))
        }
    }
}

struct CustomShapesScreen: View {
    var body: some View {
        ZStack {
            Diamond()
                .stroke(style: StrokeStyle(lineWidth: 5, dash: [10]))
                .foregroundColor(.blue)
                .frame(width: 300, height: 300)
        }
    }
}

#Preview {
    CustomShapesScreen()
}
