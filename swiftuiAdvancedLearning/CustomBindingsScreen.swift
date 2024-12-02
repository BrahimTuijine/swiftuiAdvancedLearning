//
//  CustomBindingsScreen.swift
//  swiftuiAdvancedLearning
//
//  Created by MacBook on 02/12/2024.
//

import SwiftUI

struct CustomBindingsScreen: View {
    
    @State private var title: String = "start"
    
    var body: some View {
        Text(title)
        
        ChildView(title: $title)
        ChildView2(title: title) { text in
            title = text
        }
    }
}

struct ChildView : View {
    @Binding var title: String
    
    var body: some View {
        Text("binding \(title)")
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    title = "brahim"
                }
            }
    }
}

struct ChildView2 : View {
    let title: String
    
    let setTitle: (_ value: String) -> Void
    
    var body: some View {
        Text("value  \(title)")
           
        Button("change title") {
            setTitle("new value")
        }
    }
}

#Preview {
    CustomBindingsScreen()
}
