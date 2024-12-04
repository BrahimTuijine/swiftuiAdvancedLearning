//
//  KeyPathsScreen.swift
//  swiftuiAdvancedLearning
//
//  Created by MacBook on 04/12/2024.
//

import SwiftUI

struct MyDataModel {
    let id = UUID().uuidString
    let title: String
    let date: Date
}

struct KeyPathsScreen: View {
    
    @State private var screentitle: String = ""
    
    var body: some View {
        Text(screentitle)
            .onAppear {
                
                let item = MyDataModel(title: "One", date: .now)
                
//                let title = item.title
                let title = item[keyPath: \.title]
                
                screentitle = title
            }
    }
}

#Preview {
    KeyPathsScreen()
}
