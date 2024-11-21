//
//  ViewBuilderScreen.swift
//  swiftuiAdvancedLearning
//
//  Created by MacBook on 21/11/2024.
//

import SwiftUI

struct HeaderViewRegular : View {
    
    let title : String
    let description : String
    let image: String?
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                Text(description)
                    .font(.callout)
                
                if let image = image {
                    Image(systemName: image)
                }
                
                
                RoundedRectangle(cornerRadius: 25)
                    .frame(height: 2)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
            
        }
    }
}

struct HeaderViewGeneric<T:View> : View {
    
    let title : String
    let content : T
    
    init(title: String, @ViewBuilder content: () -> T) {
        self.title = title
        self.content = content()
    }
    
    var body: some View {
        VStack {
            VStack(alignment: .leading) {
                Text(title)
                    .font(.largeTitle)
                    .fontWeight(.semibold)
                
                content
                
                
                RoundedRectangle(cornerRadius: 25)
                    .frame(height: 2)
            }
            .frame(maxWidth: .infinity, alignment: .leading)
            .padding()
        }
    }
}

struct CustomHstack<Content: View> : View {
    let content: Content
    
    init(@ViewBuilder content: () -> Content) {
        self.content = content()
    }
    
    var body: some View {
        HStack {
            content
        }
    }
}

struct ViewBuilderScreen: View {
    var body: some View {
        VStack {
            HeaderViewRegular(title: "Title", description: "Description", image: "heart.fill")
            
            HeaderViewRegular(title: "Another title", description: "Description", image: nil)
            
            HeaderViewGeneric(title: "hello brahim") {
                Text("body")
            }
            
            CustomHstack {
                Text("brahim")
                Text("brahim")
            }
            
            HStack {
                Text("brahim")
                Text("brahim")
            }
            
            Spacer()
        }
    }
}

#Preview {
    ViewBuilderScreen()
}
