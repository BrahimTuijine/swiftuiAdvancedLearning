//
//  GeometryPreferenceKeyScreen.swift
//  swiftuiAdvancedLearning
//
//  Created by MacBook on 21/11/2024.
//

import SwiftUI

struct GeometryPreferenceKeyScreen: View {
    
    @State private var rectangleSize : Double = 0
    
    var body: some View {
        VStack {
            Spacer()
            Text("\(rectangleSize)")
                .padding()
                .background(Color.blue.cornerRadius(10))
                

            Spacer()
            HStack {
                SizerViewReader {
                    Rectangle()
                }
                Rectangle()
                Rectangle()
            }
            .frame(height: 55.0)
            
        }
        .onPreferenceChange(RectangleSizeKey.self, perform: { value in
            rectangleSize = value
        })
    }
}

#Preview {
    GeometryPreferenceKeyScreen()
}

struct RectangleSizeKey : PreferenceKey {
    static var defaultValue: Double = 0
    
    static func reduce(value: inout Double, nextValue: () -> Double) {
        value = nextValue()
    }
}

extension View {
    func viewSizeSetter(viewWidth: Double) -> some View {
        self.preference(key: RectangleSizeKey.self, value: viewWidth)
    }
}

struct SizerViewReader<T: View> : View {
    
    let content: T
    
    init(@ViewBuilder content: () -> T) {
        self.content = content()
    }
    
    var body: some View {
        GeometryReader(content: { geometry in
            content
                .viewSizeSetter(viewWidth: geometry.size.width)
                .overlay {
                    Text("\(geometry.size.width)")
                        .foregroundColor(.white)
                }
                
        })
        
    }
}
