//
//  CustomNavBarView.swift
//  swiftuiAdvancedLearning
//
//  Created by MacBook on 25/11/2024.
//

import SwiftUI

struct CustomNavBarView: View {
    
    @Environment(\.dismiss) var dismiss
    @State private var showBackBtn: Bool = true
    @State private var title: String = "Title"
    @State private var subTitle: String? = "subTitle"
    
    var body: some View {
        HStack {
            if showBackBtn {
                backButton
            }
            Spacer()
            titleSection
            Spacer()
            if showBackBtn {
                backButton.opacity(0)
            }
        }
        .padding()
        .font(.headline)
        .foregroundColor(.white)
        .background(Color.blue)
        
    }
}

#Preview {
    VStack {
        CustomNavBarView()
        Spacer()
    }
}


extension CustomNavBarView {
    
    private var backButton: some View {
        Button(action: {
            dismiss()
        }, label: {
            Image(systemName: "chevron.left")
        })
    }
    
    private var titleSection : some View {
        VStack(alignment: .leading, spacing: 4.0) {
            Text(title)
                .font(.title)
                .fontWeight(.semibold)
            if let subTitle = subTitle {
                Text(subTitle)
            }
        }
    }
}
