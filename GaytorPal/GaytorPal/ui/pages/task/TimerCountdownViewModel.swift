//
//  TimerCountdownViewMode.swift
//  GaytorPal
//
//  Created by David Denis on 4/15/24.
//

import Foundation

class TimerCountdownViewModel: ObservableObject {
    @Published var timeRemaining: String = ""
    var timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()
    var dueDate: Date

    init(dueDate: Date) {
        self.dueDate = dueDate
        updateTimeRemaining()
    }

    func updateTimeRemaining() {
        let currentDate = Date()
        let interval = dueDate.timeIntervalSince(currentDate)
        
        if interval > 0 {
            let days = Int(interval / 86400)
            let hours = Int((interval.truncatingRemainder(dividingBy: 86400)) / 3600)
            let minutes = Int((interval.truncatingRemainder(dividingBy: 3600)) / 60)
            let seconds = Int(interval.truncatingRemainder(dividingBy: 60))
            timeRemaining = "\(days)d \(hours)h \(minutes)m \(seconds)s"
        } else {
            timeRemaining = "Time's up!"
            timer.upstream.connect().cancel()
        }
    }
}
