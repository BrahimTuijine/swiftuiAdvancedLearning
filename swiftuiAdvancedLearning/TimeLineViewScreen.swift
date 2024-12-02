//
//  TimeLineViewScreen.swift
//  swiftuiAdvancedLearning
//
//  Created by MacBook on 02/12/2024.
//

import SwiftUI

struct TimeLineViewScreen: View {
    var body: some View {
        VStack {
            TimelineView(.animation(minimumInterval: 1, paused: false)) { context in
                Text("\(context.date)")
                Text("\(context.date.timeIntervalSince1970)")
                
                let secondes = Calendar.current.component(.second, from: context.date)
                Text("\(secondes)")
                
                Rectangle()
                    .frame(
                        width: secondes < 10 ? 50 : secondes < 20 ? 200 : 40,
                        height: 100
                    )
                    .animation(.bouncy, value: secondes)
            }
        }
    }
}

#Preview {
    TimeLineViewScreen()
}
