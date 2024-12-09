//
//  PropertyWrapper2Screen.swift
//  swiftuiAdvancedLearning
//
//  Created by MacBook on 08/12/2024.
//

import SwiftUI

@propertyWrapper
struct Uppercased: DynamicProperty {
    
    @State private var value: String
    
    var wrappedValue: String {
        get {
            value
        }
        nonmutating set {
            value = newValue.uppercased()
        }
    }
    
    init(wrappedValue: String = "") {
        value = wrappedValue.uppercased()
    }
    
}


@propertyWrapper
struct FileManagerCodableProperty<T: Codable>: DynamicProperty {
    @State private var value: T?
    private let key: String
    
    var wrappedValue: T? {
        get {
            value
        }
        nonmutating set {
            save(newValue: newValue)
        }
    }
    
    var projectedValue: Binding<T?> { // now we can use $ (binding value)
//        Binding {
//            wrappedValue
//        } set: { newValue in
//            wrappedValue = newValue
//        }
        
        // same code
        Binding(
            get: { wrappedValue },
            set: { wrappedValue = $0 }
        )
    }
    
    init(_ key: String) {
        self.key = key
        do {
            let savedValue = try Data(contentsOf: FileManager.documnetsPath(key))
            let data = try JSONDecoder().decode(T.self, from: savedValue)
            _value = State(wrappedValue: data)
            print("Success read")
        } catch {
            _value = State(wrappedValue: nil)
            print("Error read \(error)")
        }
    }
    
    
    fileprivate init(_ key: KeyPath<FileManagerPaths, String>) {
        
        let keyPath = FileManagerPaths.instance[keyPath: key]
        let key = keyPath
        self.key = key
        
        do {
            let savedValue = try Data(contentsOf: FileManager.documnetsPath(key))
            let data = try JSONDecoder().decode(T.self, from: savedValue)
            _value = State(wrappedValue: data)
            print("Success read")
        } catch {
            _value = State(wrappedValue: nil)
            print("Error read \(error)")
        }
    }
    
    func save(newValue: T?) -> Void {
        
        do {
            let data = try JSONEncoder().encode(newValue)
            try data.write(to: FileManager.documnetsPath(key))
            self.value = newValue
            print("success saving".uppercased())
        } catch {
            print("error saving \(error)".uppercased())
        }
    }
}

private struct UserModel: Codable {
    let name: String
    let age: Int
    let isPremium: Bool
}

private struct FileManagerPaths {
    static let instance: FileManagerPaths = FileManagerPaths()
    
    private init() {}
    
    let userProfile: String = "user_profile"
    
}

struct PropertyWrapper2Screen: View {
    
//    @FileManagerCodableProperty("user_profile") private var userProfile: UserModel?
    @FileManagerCodableProperty(\.userProfile) private var userProfile: UserModel?
    
    var body: some View {
        VStack {  
            SomeBindingView(userProfile: $userProfile)
        }
        .onAppear {
            print(NSHomeDirectory())
        }
    }
}

struct SomeBindingView: View {
    
    @Binding fileprivate var userProfile: UserModel?
    
    var body: some View {
        Button(userProfile?.name ?? "") {
            userProfile = UserModel(name: "brahim", age: 24, isPremium: false)
        }
    }
}

#Preview {
    PropertyWrapper2Screen()
}
