//
//  SubscriptsScreen.swift
//  swiftuiAdvancedLearning
//
//  Created by MacBook on 10/12/2024.
//

import SwiftUI


extension Array where Element == String {
//    subscript(atIndex: Double) -> Element? {
//        for (index, element) in self.enumerated() {
//            if Double(index) == atIndex {
//                return element
//            }
//        }
//        return nil
//    }
    
    
    subscript(item: String) -> Element? {
        self.first(where: { $0 == item })
    }
    
}

struct Customer {
    let name: String
    let address: String
    
    subscript(value: String) -> String? {
        switch value {
        case "name":
            return name
        case "address":
            return address
        default:
            return nil
        }
    }
}

struct SubscriptsScreen: View {
    
    @State private var items: [String] = ["one", "two", "three"]
    @State private var selectedItem: String?
    
    var body: some View {
        VStack {
            ForEach(items, id: \.self) { item in
                Text(item)
            }
            
            Text("SELECTED: \(selectedItem ?? "none")")
        }
        .onAppear {
            let customer = Customer(name: "brahim", address: "el alia")
            selectedItem = customer["name"]
        }
    }
}

#Preview {
    SubscriptsScreen()
}
