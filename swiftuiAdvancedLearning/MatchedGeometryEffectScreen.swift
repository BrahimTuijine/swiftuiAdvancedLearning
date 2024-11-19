//
//  MatchedGeometryEffectScreen.swift
//  swiftuiAdvancedLearning
//
//  Created by MacBook on 19/11/2024.
//

import SwiftUI

struct MatchedGeometryEffectScreen: View {
    
    @State private var isClicked: Bool = false
    @Namespace private var nameSpace
    
    var body: some View {
        VStack {
            
            if !isClicked {
                RoundedRectangle(cornerRadius: 25)
                    .matchedGeometryEffect(id: "rectangle", in: nameSpace)
                    .frame(width: 100, height: 100)
                    
            }
            
            
            Spacer()
            
            if isClicked {
                Circle()
                    .matchedGeometryEffect(id: "rectangle", in: nameSpace)
                    .frame(width: 300, height: 100)
                    
            }
        }
        .frame(maxWidth: .infinity, maxHeight: .infinity)
        .background(Color.red)
        .onTapGesture {
            withAnimation(.easeInOut) {
                isClicked.toggle()
            }
        }
    }
}

#Preview {
    MatchedGeometryEffectExample2()
}


struct MatchedGeometryEffectExample2 : View {
    
    private let categories: [String] = ["Home", "Popular","Saved"]
    
    @State private var selcted : String = ""
    
    @Namespace private var nameSpace
    
    var body: some View {
        HStack {
            ForEach(categories, id: \.self) { category in
                ZStack(alignment: .bottom) {
                    if category == selcted {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(Color.red.opacity(0.3))
                            .matchedGeometryEffect(id: "category_background", in: nameSpace)
                            .frame(width: 35, height: 2)
                            .offset(y: 10)
                    }
                    
                    Text(category)
                        .foregroundColor(selcted == category ? Color.red : Color.black)
                }
                .frame(maxWidth: .infinity)
                .frame(height: 55)
                .onTapGesture {
                    withAnimation(.spring()) {
                        selcted = category
                    }
                }
            }
        }
        .padding()
    }
}
