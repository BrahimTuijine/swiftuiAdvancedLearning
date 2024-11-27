//
//  AdvancedCombine.swift
//  swiftuiAdvancedLearning
//
//  Created by MacBook on 27/11/2024.
//

import SwiftUI
import Combine

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
    
    let dataService = AdvancedCombineDataService()
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    private func addSubscribers() -> Void {
        dataService.$basicPublisher.sink { [weak self] value in
            self?.data = value
        }
        .store(in: &cancellables)
    }
    
    
    
}

struct AdvancedCombine: View {
    
    @StateObject private var vm = AdvancedCombineViewModel()
    
    var body: some View {
        
            List {
                ForEach(vm.data, id: \.self) { value in
                    Text(value)
                }
            }
        
    }
}

#Preview {
    AdvancedCombine()
}
