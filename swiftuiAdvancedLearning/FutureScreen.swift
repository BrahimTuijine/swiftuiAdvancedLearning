//
//  FutureScreen.swift
//  swiftuiAdvancedLearning
//
//  Created by MacBook on 29/11/2024.
//

import SwiftUI
import Combine

class FutureViewModel: ObservableObject {
    @Published var title: String = "starting title"
    let url = URL(string: "https://www.google.com")
    
    var cancellables = Set<AnyCancellable>()
    
    init() {
        download()
    }
    
    private func download() -> Void {
        doSomthingInFuture()
            .sink { _ in
                
            } receiveValue: { [weak self] string in
                self?.title = string
            }
            .store(in: &cancellables)
        
//        getEscapingClosure { [weak self] data, error in
//            self?.title = data
//        }

    }
    
    private func getCombinePublisher() -> AnyPublisher<String, URLError> {
        URLSession.shared.dataTaskPublisher(for: url!)
            .timeout(1, scheduler: DispatchQueue.main)
            .map({ _ in "new Value" })
            .eraseToAnyPublisher()
    }
    
    private func getEscapingClosure(completion: @escaping (_ data: String, _ error: Error?) -> ()) -> Void {
        URLSession.shared.dataTask(with: url!) { data, response, error in
            completion("new Value 2", nil)
        }
        .resume()
    }
    
    private func getFuturePublisher() -> Future<String, Error> {
        Future { [weak self] promise in
            self?.getEscapingClosure { returnedValue, error in
                if let error = error {
                    promise(.failure(error))
                } else {
                    promise(.success(returnedValue))
                }
                
            }
        }
    }
    
    private func doSomething(completion: @escaping (_ value: String) -> ()) -> Void {
        DispatchQueue.main.asyncAfter(deadline: .now() + 4) {
            completion("new String")
        }
    }
    
    func doSomthingInFuture() -> Future<String, Never> {
        Future { [weak self] promise in
            self?.doSomething { value in
                promise(.success(value))
            }
        }
    }
 }

struct FutureScreen: View {
    
    @StateObject private var vm = FutureViewModel()
    
    var body: some View {
        Text(vm.title)
            .font(.title)
    }
}

#Preview {
    FutureScreen()
}
