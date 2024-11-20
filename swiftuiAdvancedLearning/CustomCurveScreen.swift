//
//  CustomCurveScreen.swift
//  swiftuiAdvancedLearning
//
//  Created by MacBook on 20/11/2024.
//

import SwiftUI

struct CustomCurveScreen: View {
    var body: some View {
        ArcSimple()
            .stroke(style: StrokeStyle(lineWidth: 5))
            .frame(width: 200, height: 200)
    }
}

#Preview {
    CustomCurveScreen()
}

struct ArcSimple : Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.midX, y: rect.midY))
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY),
                radius: rect.height / 2,
                startAngle: Angle(degrees: 20),
                endAngle: Angle(degrees: 340),
                clockwise: false
            )
            path.addLine(to: CGPoint(x: rect.midX, y: rect.midY))
        }
    }
}
