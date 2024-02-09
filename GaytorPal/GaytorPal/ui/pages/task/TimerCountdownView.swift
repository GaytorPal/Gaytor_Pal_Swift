//
//  TimerCountdownView.swift
//  GaytorPal
//
//  Created by David Denis on 4/15/24.
//

import SwiftUI

struct TimerCountdownView: View {
    
    
    @ObservedObject var timer: TimerCountdownViewModel
    
    
    var body: some View {
        
        Text(timer.timeRemaining)
                    .font(.caption2)
                    .fontWeight(.bold)
                    .monospaced()
                    .onReceive(timer.timer) { _ in
                        timer.updateTimeRemaining() // Update the remaining time every second
                    }
            
           
    }
    
    
}

#Preview {
    TimerCountdownView(timer: TimerCountdownViewModel(dueDate: Calendar.current.date(byAdding: .day, value: 2, to: Date())!))
}
