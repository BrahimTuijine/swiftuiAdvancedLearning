//
//  TimeLineViewScreen.swift
//  swiftuiAdvancedLearning
//
//  Created by MacBook on 02/12/2024.
//

import SwiftUI

struct TimeLineViewScreen: View {
    
    @State private var startTime: Date = .now
    @State private var pauseAnimation: Bool = false
    
    var body: some View {
        VStack {
            TimelineView(.animation(minimumInterval: 1, paused: pauseAnimation)) { context in
                Text("\(context.date)")
                Text("\(context.date.timeIntervalSince1970)")
                
                let secondes = context.date.timeIntervalSince(startTime)
                Text("\(secondes)")
                
                Rectangle()
                    .frame(
                        width: secondes < 10 ? 50 : secondes < 20 ? 200 : 40,
                        height: 100
                    )
                    .animation(.bouncy, value: secondes)
            }
            
            Button(pauseAnimation ? "PLAY" : "PAUSE") {
                pauseAnimation.toggle()
            }
        }
        .padding()
    }
}

#Preview {
    TimeLineViewScreen()
}
