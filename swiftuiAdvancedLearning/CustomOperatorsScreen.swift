//
//  CustomOperatorsScreen.swift
//  swiftuiAdvancedLearning
//
//  Created by MacBook on 10/12/2024.
//

import SwiftUI

struct CustomOperatorsScreen: View {
    
    @State private var value: Double = 0
    
    var body: some View {
        Text("\(value)")
            .onAppear {
                value = 17 +/ 2
            }
    }
}

infix operator +/

extension FloatingPoint {
    static func +/ (lhs: Self, rhs: Self) -> Self {
        (lhs + lhs) / rhs
    }
}

#Preview {
    CustomOperatorsScreen()
}
