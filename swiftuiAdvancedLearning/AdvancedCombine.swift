//
//  AdvancedCombine.swift
//  swiftuiAdvancedLearning
//
//  Created by MacBook on 27/11/2024.
//

import SwiftUI
import Combine

class AdvancedCombineDataService {
    
//    @Published var basicPublisher: String = ""
    let currentValuePublisher = CurrentValueSubject<String, Error>("first publish")
    let passThroughPublisher = PassthroughSubject<String, Error>()
    
    init() {
        publishFakeData()
    }
    private func publishFakeData() -> Void {
        
        let items = ["one", "two", "three"]
        
        for x in items.indices {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(x) + 1) {
                self.passThroughPublisher.send(items[x])
            }
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
        dataService.passThroughPublisher
            .sink(receiveCompletion: { completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                }
            },receiveValue: { [weak self] value in
                self?.data.append(value)
            })
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
