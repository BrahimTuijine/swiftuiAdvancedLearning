//
//  CustomNavBarContainerView.swift
//  swiftuiAdvancedLearning
//
//  Created by MacBook on 25/11/2024.
//

import SwiftUI

struct CustomNavBarContainerView<V: View>: View {
    
    let content: V
    
    init(@ViewBuilder content: () -> V) {
        self.content = content()
    }
    
    var body: some View {
        VStack(spacing: 0.0) {
            CustomNavBarView()
            content
                .frame(maxWidth: .infinity, maxHeight: .infinity)
        }
    }
}

#Preview {
    CustomNavBarContainerView() {
        ZStack {
            Color.green.ignoresSafeArea()
                
            Text("hello brahim")
                .foregroundColor(.white)
        }
    }
            
}
