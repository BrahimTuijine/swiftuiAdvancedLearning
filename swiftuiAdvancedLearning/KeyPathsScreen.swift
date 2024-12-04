//
//  KeyPathsScreen.swift
//  swiftuiAdvancedLearning
//
//  Created by MacBook on 04/12/2024.
//

import SwiftUI

struct MyDataModel : Identifiable {
    let id = UUID().uuidString
    let title: String
    let date: Date
    let count: Int
}

extension Array {
    
   // sort the array it self
   mutating func sortByKeyPath<T: Comparable>(_ keyPath: KeyPath<Element, T>, ascending: Bool = true) {
        self.sort(by: {
            let value1 = $0[keyPath: keyPath]
            let value2 = $1[keyPath: keyPath]
            
            return ascending ? value1 < value2 : value1 > value2
            
        })
    }
    
    
    
    // return new sorted array
    func sortedByKeyPath<T: Comparable>(_ keyPath: KeyPath<Element, T>, ascending: Bool = true) -> [Element] {
        self.sorted(by: {
            let value1 = $0[keyPath: keyPath]
            let value2 = $1[keyPath: keyPath]
            
            return ascending ? value1 < value2 : value1 > value2
            
        })
    }
}

struct KeyPathsScreen: View {
    
    @State private var screentitle: String = ""
    @State private var dataArray: [MyDataModel] = []
    
    var body: some View {
        List {
            ForEach(dataArray) { data in
                VStack(alignment: .leading) {
                    Text("\(data.count)")
                    Text(data.title)
                    Text(data.date.description)
                }
                .font(.headline)
            }
        }
            .onAppear {
                let array = [
                    MyDataModel(title: "Three", date: .distantFuture, count: 3),
                    MyDataModel(title: "One", date: .now, count: 1),
                    MyDataModel(title: "Two", date: .distantPast , count: 2),
                ]
                
//                let sortedArray = array.sorted(by: {$0.count < $1.count})
                
                //using keyPaths
//                let sortedArray = array.sorted(by: {$0[keyPath: \.count] < $1[keyPath: \.count]})
                
                let sortedArray = array.sortedByKeyPath(\.count, ascending: false)
            
                
                dataArray = sortedArray
            }
    }
}

#Preview {
    KeyPathsScreen()
}
