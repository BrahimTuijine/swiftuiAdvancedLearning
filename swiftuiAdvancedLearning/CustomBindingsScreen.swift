//
//  CustomBindingsScreen.swift
//  swiftuiAdvancedLearning
//
//  Created by MacBook on 02/12/2024.
//

import SwiftUI

struct CustomBindingsScreen: View {
    
    @State private var title: String = "start"
    
    @State private var errorTitle: String?
//    @State private var showError: Bool = false
    
    var body: some View {
        VStack {
            Text(title)
            
            ChildView(title: $title)
            ChildView2(title: title) { text in
                title = text
            }
            ChildView3(title: $title)
            ChildView3(title: Binding(get: {
                return title
            }, set: { newValue in
                title = newValue
            }))
            
            Button("click me") {
                errorTitle = "new Error !!"
//                showError.toggle()
            }
        }
        .alert(errorTitle ?? "this is error", isPresented: Binding(get: {
           return errorTitle != nil
        }, set: { newValue in
            if !newValue {
                errorTitle = nil
            }
        })) {
            Button("Ok") {
               
            }
        }
//        .alert(errorTitle ?? "this is error", isPresented: $showError) {
//            Button("Ok") {
//                
//            }
//        }
    }
        
}

struct ChildView : View {
    @Binding var title: String
    
    var body: some View {
        Text("binding \(title)")
            .onAppear {
                DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                    title = "brahim"
                }
            }
    }
}

struct ChildView2 : View {
    let title: String
    
    let setTitle: (_ value: String) -> Void
    
    var body: some View {
        Text("value  \(title)")
           
        Button("change title") {
            setTitle("new Title 2")
        }
    }
}

struct ChildView3 : View {
    let title: Binding<String>
    
    var body: some View {
        Text("\(title.wrappedValue)")
            .onAppear {
                title.wrappedValue = "new Title 3"
            }
    }
}

#Preview {
    CustomBindingsScreen()
}
