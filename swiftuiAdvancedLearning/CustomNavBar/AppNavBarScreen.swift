//
//  AppNavBarScreen.swift
//  swiftuiAdvancedLearning
//
//  Created by MacBook on 25/11/2024.
//

import SwiftUI

struct AppNavBarScreen: View {
    var body: some View {
        NavigationStack {
            CustomNavBarContainerView {
                ZStack {
                    Color.orange.ignoresSafeArea()
                    
                    CustomNavLinkView {
                       Text("navigate")
                    } destination: {
                        Text("destination")
                           
                    }
                    
                    

                    
                
                }
            }
        }
    }
}



#Preview {
    AppNavBarScreen()
}


extension AppNavBarScreen {
    private var defaultNavView : some View {
        NavigationStack {
            ZStack {
                
                Color.green.ignoresSafeArea()
                
                VStack(spacing: 40) {
                    NavigationLink("Details") {
                        DetailsScreen()
                    }
                    
                }
                .navigationTitle("Main View")
            }
            .navigationTitle("Nav title here")

        }
    }
}

struct DetailsScreen: View {
    var body: some View {
        Text("Details Screen")
            .navigationTitle("Details")
    }
}
