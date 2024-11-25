//
//  CustomNavLinkView.swift
//  swiftuiAdvancedLearning
//
//  Created by MacBook on 25/11/2024.
//

import SwiftUI

struct CustomNavLinkView<view: View>: View {
    
    let label: view
    let destination: view
    
    init(@ViewBuilder label: () -> view, @ViewBuilder destination: () -> view) {
        self.label = label()
        self.destination = destination()
    }
    
    var body: some View {
        NavigationLink {
            CustomNavBarContainerView {
                destination
                
            }
        } label: {
            label
        }
    }
}

#Preview {
    NavigationStack {
        CustomNavLinkView {
            Text("Click me")
        } destination: {
            Text("Destination")
        }

    }
}
