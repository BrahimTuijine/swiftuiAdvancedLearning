//
//  UIViewControllerRepresentableScreen.swift
//  swiftuiAdvancedLearning
//
//  Created by MacBook on 26/11/2024.
//

import SwiftUI

struct UIViewControllerRepresentableScreen: View {
    
    @State var showScreen : Bool = false
    @State var image : UIImage?
    
    var body: some View {
        VStack {
            Text("Hello, World!")
            
            Button("showScreen") {
                showScreen.toggle()
            }
            
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 200, height: 200)
            }
            
        }
        .sheet(isPresented: $showScreen, content: {
            UIImagePickerControllerRepresentable(image: $image, showScreen: $showScreen)
//            BasicUIViewRepresentableController(labelText: "new text")
        })
    }
}

#Preview {
    UIViewControllerRepresentableScreen()
}

struct UIImagePickerControllerRepresentable: UIViewControllerRepresentable  {
    
    @Binding var image: UIImage?
    @Binding var showScreen : Bool
    
    func makeUIViewController(context: Context) -> UIImagePickerController {
        let vc = UIImagePickerController()
        vc.allowsEditing = false
        vc.delegate = context.coordinator
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIImagePickerController, context: Context) {
        
    }
    
    func makeCoordinator() -> Coordinator {
        return Coordinator(image: $image, showScreen: $showScreen)
    }
    
    class Coordinator: NSObject, UIImagePickerControllerDelegate & UINavigationControllerDelegate {
        
        @Binding var image: UIImage?
        @Binding var showScreen : Bool
        
        init(image: Binding<UIImage?>, showScreen: Binding<Bool>) {
            self._image = image
            self._showScreen = showScreen
        }
        
        func imagePickerController(_ picker: UIImagePickerController, didFinishPickingMediaWithInfo info: [UIImagePickerController.InfoKey : Any]) {
            guard let newImage = info[.originalImage] as? UIImage else { return }
            
            image = newImage
            showScreen.toggle()
        }
    }
    
}

struct BasicUIViewRepresentableController : UIViewControllerRepresentable {
    
    let labelText: String
    
    func makeUIViewController(context: Context) -> some UIViewController {
        let vc = MyFirstViewController()
        vc.labelText = labelText
        
        return vc
    }
    
    func updateUIViewController(_ uiViewController: UIViewControllerType, context: Context) {
        
    }
}

class MyFirstViewController: UIViewController {
    
    var labelText: String = "Starting value"
    
    override func viewDidLoad() {
        super.viewDidLoad()
        
        view.backgroundColor = .blue
        let label = UILabel()
        label.text = labelText
        label.textColor = .white
        label.frame = view.frame
        view.addSubview(label)
    }
}
