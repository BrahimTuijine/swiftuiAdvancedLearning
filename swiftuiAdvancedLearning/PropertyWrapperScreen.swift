//
//  PropertyWrapperScreen.swift
//  swiftuiAdvancedLearning
//
//  Created by MacBook on 05/12/2024.
//

import SwiftUI

extension FileManager {
    static func documnetsPath(_ key: String) -> URL {
        FileManager.default
            .urls(for: .documentDirectory, in: .userDomainMask)
            .first!
            .appending(path: "\(key).text")
    }
}

@propertyWrapper
struct MyFileManagerProperty: DynamicProperty {
    @State private var title: String
    private let key: String
    
    var wrappedValue: String {
        get {
            title
        }
        nonmutating set {
            save(newValue: newValue)
        }
    }
    
    
    init(wrappedValue: String = "Starting text", _ key: String) {
        self.key = key
        do {
            let savedValue = try String(contentsOf: FileManager.documnetsPath(key), encoding: .utf8)
            title = savedValue
            print("Success read")
        } catch {
            title = wrappedValue
            print("Error read \(error)")
        }
    }
    
    func save(newValue: String) -> Void {
        
        do {
            try newValue.write(to: FileManager.documnetsPath(self.key), atomically: false, encoding: .utf8)
            self.title = newValue
            print("success saving".uppercased())
        } catch {
            print("error saving \(error)".uppercased())
        }
    }
}

struct PropertyWrapperScreen: View {
    
    @MyFileManagerProperty("custom_title_1") private var title1: String = "init wrappedValue"
    @MyFileManagerProperty("custom_title_2") private var title2: String = "init wrappedValue2"
    
//    @State private var title: String = "starting title"
    
    var body: some View {
        VStack(spacing: 40.0) {
            Text(title1).font(.largeTitle)
            Text(title2).font(.largeTitle)
            
            Button("click me 1") {
                title1 = "title 1"
            }
            Button("click me 2") {
                
                title1 = "title 2"
                title2 = "random title"
            }
        }
    }
    
    
    
    
}

#Preview {
    PropertyWrapperScreen()
}
