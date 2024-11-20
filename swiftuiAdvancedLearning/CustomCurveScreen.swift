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
            .fill(
                LinearGradient(
                    gradient: Gradient(colors: [Color.blue, Color.blue]),
                    startPoint: .leading,
                    endPoint: .trailing)
            )
            .ignoresSafeArea()
//            .stroke(style: StrokeStyle(lineWidth: 5))
            .frame(width: 200, height: 200)
    }
}

#Preview {
    CustomCurveScreen()
}

struct WaterShape : Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX, y: rect.midY))
            
            path.addQuadCurve(
                to: CGPoint(x: rect.midX, y: rect.midY),
                control: CGPoint(x: rect.width * 0.25, y: rect.height * 0.40))
            
            path.addQuadCurve(
                to: CGPoint(x: rect.maxX, y: rect.midY),
                control: CGPoint(x: rect.width * 0.75, y: rect.height * 0.60))
            
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.maxY))
            path.addLine(to: CGPoint(x: rect.minX, y: rect.maxY))
        }
    }
}

struct QuadSimple : Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: .zero)
            path.addQuadCurve(
                to: CGPoint(x: rect.midX,y: rect.midY),
                control: CGPoint(x: rect.minX, y: rect.maxY)
            )
        }
    }
}

struct ShapeWithArc : Shape {
    func path(in rect: CGRect) -> Path {
        Path { path in
            path.move(to: CGPoint(x: rect.minX, y: rect.minY))
            
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.minY))
            
            path.addLine(to: CGPoint(x: rect.maxX, y: rect.midY))
            
            path.addArc(
                center: CGPoint(x: rect.midX, y: rect.midY),
                radius: rect.height / 2,
                startAngle: Angle(degrees: 0),
                endAngle: Angle(degrees: 180),
                clockwise: false
            )
//            path.addLine(to: CGPoint(x: rect.midX, y: rect.maxY))
            
            path.addLine(to: CGPoint(x: rect.minX, y: rect.midY))
        
        }
    }
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
