//
//  UIViewRepresentableScreen.swift
//  swiftuiAdvancedLearning
//
//  Created by MacBook on 25/11/2024.
//

import SwiftUI

struct UIViewRepresentableScreen: View {
    
    @State var field: String = ""
    var body: some View {
        VStack {
            TextField("Type here...", text: $field)
                .frame(height: 55)
                .background(Color.gray)
            
            UITextFieldViewRepresentable()
                .frame(height: 55)
                .background(Color.gray)
        }
    }
}

#Preview {
    UIViewRepresentableScreen()
}

struct UITextFieldViewRepresentable: UIViewRepresentable {
    
    func makeUIView(context: Context) -> some UIView {
        let textField = UITextField(frame: .zero)
        
        textField.attributedPlaceholder = 
        NSAttributedString(
            string: "Type here ...",
            attributes: [
                .foregroundColor : UIColor.red
            ])
        return textField
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}

struct BasicUiViewRepresentable : UIViewRepresentable {
    
    func makeUIView(context: Context) -> some UIView {
        let view = UIView()
        view.backgroundColor = .red
        return view
    }
    
    func updateUIView(_ uiView: UIViewType, context: Context) {
        
    }
}
