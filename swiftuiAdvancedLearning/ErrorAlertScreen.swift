//
//  ErrorAlertScreen.swift
//  swiftuiAdvancedLearning
//
//  Created by MacBook on 03/12/2024.
//

import SwiftUI

protocol AlerProtocol {
    var buttons: AnyView { get };
    var errorDescription: String? { get }
    var title: String { get  }
}

extension View {
    func showCustomAlert<T: AlerProtocol>(error: Binding<T?>) -> some View {
        self
            .alert(error.wrappedValue?.title ?? "error", isPresented: Binding(value: error)) {
                error.wrappedValue?.buttons
        } message: {
            if let error = error.wrappedValue?.errorDescription {
                Text(error)
            }
        }
    }
}

struct ErrorAlertScreen: View {
    
    @State private var error: myCustomAlert?
    
    var body: some View {
        Button("show alert") {
            saveData()
        }
        .showCustomAlert(error: $error)
    }
    
   
    
//    enum myCustomError : Error, LocalizedError {
//        case noInternetConnection
//        case dataNotFound
//        case serverError(errorMsg: String)
//        
//        var errorDescription: String? {
//            switch self {
//            case .noInternetConnection:
//                "Please check your internet connection and try again."
//            case .dataNotFound:
//                "there was an error loading data. Please try again later"
//            case .serverError(errorMsg: let errorMsg):
//                errorMsg
//            }
//        }
//    }
    
    enum myCustomAlert : Error, AlerProtocol {
                
        case noInternetConnection
        case dataNotFound
        case serverError(errorMsg: String?)
        
        
        var buttons: AnyView {
            AnyView(self.getButtonsForAlert)
        }

        
        var getButtonsForAlert: some View {
             switch self {
             case .noInternetConnection:
                 Button("OK") {
                     
                 }
             case .dataNotFound:
                 Button("Retry") {
                     
                 }
             default :
                 Button("Delete", role: .destructive) {
                     
                 }
             }
        }
        
        var errorDescription: String? {
            switch self {
            case .noInternetConnection:
                "Please check your internet connection and try again."
            case .dataNotFound:
                "there was an error loading data. Please try again later"
            case .serverError(errorMsg: let errorMsg):
                errorMsg
            }
        }
        
        var title: String {
            switch self {
            case .noInternetConnection:
                "No Internet Connection"
            case .dataNotFound:
                "No data"
            case .serverError(errorMsg: _):
                "server error"
            }
        }
    }
    
    private func saveData() -> Void {
        let isSuccessful: Bool = false
        
        if isSuccessful {
//            do someThing
        } else {
            
//            let myError: Error = URLError(.badServerResponse)
            let myError: myCustomAlert = .serverError(errorMsg: "unexpected")
            
            error = myError
        }
    }
}

#Preview {
    ErrorAlertScreen()
}
