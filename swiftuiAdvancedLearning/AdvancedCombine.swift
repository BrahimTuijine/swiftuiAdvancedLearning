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
//    let currentValuePublisher = CurrentValueSubject<Int, Error>("first publish")
    let passThroughPublisher = PassthroughSubject<Int, Error>()
    let boolPublisher = PassthroughSubject<Bool, Error>()
    let intPublisher = PassthroughSubject<Int, Error>()
    
    init() {
        publishFakeData()
    }
    private func publishFakeData() -> Void {
        
        let items : [Int] = Array(1..<11)
        
        for x in items.indices {
            DispatchQueue.main.asyncAfter(deadline: .now() + Double(x)) {
                self.passThroughPublisher.send(items[x])
                
                if (x > 4 && x < 8) {
                    self.boolPublisher.send(true)
                    self.intPublisher.send(999)
                } else {
                    self.boolPublisher.send(false)
                }
                
                if x == items.indices.last {
                    self.passThroughPublisher.send(completion: .finished)
                }
            }
        }
    }
}

class AdvancedCombineViewModel: ObservableObject {
    
    @Published var data : [String] = []
    @Published var booldata : [Bool] = []
    @Published var error: String = ""
    
    let dataService = AdvancedCombineDataService()
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        addSubscribers()
    }
    
    private func addSubscribers() -> Void {
        
            // Sequence Operations
            //.first()
            //.first(where: {$0 > 2})
            //.tryFirst(where: { int in
            // if int == 3 {
            //     throw URLError(.badServerResponse)
            // }
            //return int > 4
            //})
            //.last()
            // .last(where: {$0 > 4}) // it check condition after publisher finished
            //.dropFirst()
            //.dropFirst(3)
            //.drop(while: {$0 < 5}) // skip values that fulfills the condition
            //.prefix(4) // first four items
            //.output(at: 5) // index of element
            //.output(in: 2..<4)
        
            // Mathematic Operations
            //.max()
            //.min()
            
            // Filder / Reducing Operations
            //.map({ String($0) })
            //.tryMap({ int in
            //   if int == 5 {
            //      throw URLError(.badServerResponse)
            //   }
            // return String(int)
            //})
            //.compactMap({ int in
            //    if int == 5 {
            //       return nil // return nil instead of throw exception
            //    }
            //   return String(int)
            //})
            //.filter({$0 > 3 && $0 < 7 })
            //.tryFilter()
            //.removeDuplicates()
            //.tryRemoveDuplicates(by:)
            //.replaceNil(with: 5)
            //.replaceEmpty(with: [])
            //.replaceError(with: "this is an error")
            //.scan(0, { existingValue, newValue in
            //    return existingValue + newValue
            //})
            //.scan(0, +) => .scan(0, {$0 + $1} )
            //.reduce(0, +) => .scan(0, {$0 + $1} ) return one Time after finish
            //.allSatisfy({$0 < 50})
            //.allSatisfy()
            //.collect() // transform data to array of data [data]
            
            // Timing Operations
            //.debounce(for: 1, scheduler: DispatchQueue.main)
            //.delay(for: 2, scheduler: DispatchQueue.main)
            //.measureInterval(using: DispatchQueue.main) calculate time between every value
            //.throttle(for: 10, scheduler: DispatchQueue.main, latest: true)
            //.retry(3)
            //.timeout(5, scheduler: DispatchQueue.main)
              
            // multiple Publishers / Subscribers
            //.combineLatest(dataService.boolPublisher, dataService.intPublisher)
            //.compactMap({ $1 ? String($0) : "n/a" })
            //.compactMap({ (int, bool, int2) in
            //    if bool {
            //        return String(int)
            //   }
            //   return "n/a"
            //})
            //.merge(with: dataService.intPublisher)
            //.zip(dataService.boolPublisher, dataService.intPublisher)
            //.map({ tuple in
            //    return "\(tuple.0) \(tuple.1) \(tuple.2)"
            //})
            //.tryMap({ int in
            //    if int == 5 {
            //        throw URLError(.badServerResponse)
            //    }
            //    return int
            //})
            //.catch({ error in
            //    return self.dataService.intPublisher
            //})
        
        
        let sharedPublisher = dataService.passThroughPublisher
            .share()
            .multicast {
                PassthroughSubject<Int, Error>()
            }
            
        sharedPublisher
            .map({ String($0) })
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                    self?.error = error.localizedDescription
                }
            },receiveValue: { [weak self] value in
                self?.data.append(value)
            })
            .store(in: &cancellables)
        
        sharedPublisher
            .map({ $0 > 5 ? true : false })
            .sink(receiveCompletion: { [weak self] completion in
                switch completion {
                case .finished:
                    break
                case .failure(let error):
                    print(error.localizedDescription)
                    self?.error = error.localizedDescription
                }
            },receiveValue: { [weak self] value in
                self?.booldata.append(value)
            })
            .store(in: &cancellables)
        
            
        DispatchQueue.main.asyncAfter(deadline: .now() + 5) {
            sharedPublisher
                .connect()
                .store(in: &self.cancellables)
        }
        
    }
}

struct AdvancedCombine: View {
    
    @StateObject private var vm = AdvancedCombineViewModel()
    
    var body: some View {
        
        
        
        List {
            ForEach(vm.data, id: \.self) { value in
                Text(value)
            }
            if !vm.error.isEmpty {
                Text(vm.error)
            }
        }
       
        
    }
}

#Preview {
    AdvancedCombine()
}
