//
//  AdvancedCombine.swift
//  swiftuiAdvancedLearning
//
//  Created by MacBook on 27/11/2024.
//

import SwiftUI

class AdvancedCombineDataService {
    
    @Published var basicPublisher: [String] = []
    
    init() {
        publishFakeData()
    }
    private func publishFakeData() -> Void {
        DispatchQueue.main.asyncAfter(deadline: .now() + 1) {
            self.basicPublisher = ["one", "two", "three"]
        }
    }
}

class AdvancedCombineViewModel: ObservableObject {
    
    @Published var data : [String] = []
    
}

struct AdvancedCombine: View {
    
    @StateObject private var vm = AdvancedCombineViewModel()
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
    }
}

#Preview {
    AdvancedCombine()
}
