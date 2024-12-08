//
//  PropertyWrapper2Screen.swift
//  swiftuiAdvancedLearning
//
//  Created by MacBook on 08/12/2024.
//

import SwiftUI

@propertyWrapper
struct Uppercased: DynamicProperty {
    
    @State private var text: String
    
    var wrappedValue: String {
        get {
            text
        }
        nonmutating set {
            text = newValue.uppercased()
        }
    }
    
    init(wrappedValue: String = "") {
        text = wrappedValue.uppercased()
    }
    
}

struct PropertyWrapper2Screen: View {
    
    @Uppercased private var text: String = "init Value"
    
    var body: some View {
        Text(text)
        
        Button("Capitalize text") {
            text = "hello brahim"
        }
    }
}

#Preview {
    PropertyWrapper2Screen()
}
