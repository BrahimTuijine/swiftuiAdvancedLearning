//
//  PreferenceKeyScreen.swift
//  swiftuiAdvancedLearning
//
//  Created by MacBook on 21/11/2024.
//

import SwiftUI

struct PreferenceKeyScreen: View {
    
    @State private var text: String = "hello brahim"
    
    var body: some View {
        NavigationStack {
            VStack {
                SecondaryScreen(text: text)
                    .navigationTitle("Navigation title")
//                    .customTitle("new value !!!")
            }
        }
        .onPreferenceChange(CustomTitlePreferenceKey.self, perform: { value in
            self.text = value
        })
    }
}

extension View {
    func customTitle(_ title: String) -> some View {
        self.preference(key: CustomTitlePreferenceKey.self, value: title)
    }
}

struct SecondaryScreen: View {
    
    let text: String
    
    @State private var newValue : String = ""
    
    var body: some View {
        Text(text)
            .onAppear(perform: getDataFromDB)
            .customTitle(newValue)
    }
    
    func getDataFromDB() -> Void {
        DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
            newValue = "new value form database"
        }
    }
    
}

struct CustomTitlePreferenceKey : PreferenceKey {
    
    static var defaultValue: String = ""
    
    static func reduce(value: inout String, nextValue: () -> String) {
        value = nextValue()
    }
}

#Preview {
    PreferenceKeyScreen()
}
