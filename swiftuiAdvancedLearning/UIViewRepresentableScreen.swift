//
//  UIViewRepresentableScreen.swift
//  swiftuiAdvancedLearning
//
//  Created by MacBook on 25/11/2024.
//

import SwiftUI

// convert UIView to SwiftUI
struct UIViewRepresentableScreen: View {
    
    @State var text: String = ""
    var body: some View {
        VStack {
            Text(text)
            HStack {
                Text("swiftUI")
                TextField("Type here...", text: $text)
                    .frame(height: 55)
                .background(Color.gray)
            }
            
            HStack {
                Text("UIkit")
                UITextFieldViewRepresentable(text: $text)
                    .updatePlaceHolder("new placeholder")
                    .frame(height: 55)
                .background(Color.gray)
            }
        }
    }
}

#Preview {
    UIViewRepresentableScreen()
}

struct UITextFieldViewRepresentable: UIViewRepresentable {
    
    @Binding var text: String
    var placeHolder: String
    let placeHolderColor: UIColor
    
    init(text: Binding<String>,
         placeHolder: String = "default placeHolder...",
         placeHolderColor: UIColor = UIColor.red
    ) {
        self._text = text
        self.placeHolder = placeHolder
        self.placeHolderColor = placeHolderColor
    }
    
    func updatePlaceHolder(_ text: String) -> UITextFieldViewRepresentable {
        var viewRepresentable = self
        viewRepresentable.placeHolder = text
        return viewRepresentable
    }
    
    func makeUIView(context: Context) -> UITextField {
        let textField = getTextField()
        textField.delegate = context.coordinator
        return textField
    }
    
    
    // send data from SwiftUI to UIKit
    func updateUIView(_ uiView: UITextField, context: Context) {
        uiView.text = text
    }
    
    
    // send data from UIKit to SwiftUI
    func makeCoordinator() -> Coordinator {
        return Coordinator(text: $text)
    }
    
    class Coordinator: NSObject, UITextFieldDelegate {
        
        @Binding var text: String
        
        init(text: Binding<String>) {
            self._text = text
        }
        
        func textFieldDidChangeSelection(_ textField: UITextField) {
            self.text = textField.text ?? ""
        }
    }
    
    private func getTextField() -> UITextField {
        let textField = UITextField(frame: .zero)
        
        textField.attributedPlaceholder =
        NSAttributedString(
            string: placeHolder,
            attributes: [
                .foregroundColor : placeHolderColor
            ])
        return textField
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
