//
//  Task.swift
//  GaytorPal
//
//  Created by David Denis on 3/29/24.
//

import Foundation
import SwiftUI

struct Assignment: Identifiable, Codable, Equatable {
    
    var id : String = "123"
    var taskTitle: String
    var taskDescription: String
    var dueDate: Date
    var category: TaskCategory
    var completed: Bool = false
    
}


enum TaskCategory: String, Codable, CaseIterable, Identifiable, Hashable {
    
    case assignment = "Assignment"
    case classEvent = "Class Event"
    case clubEvent = "Club Event"
    case personalEvent = "Personal Event"
    
    var id: Self {self}
    
    var color: Color {
            switch self {
            case .assignment:
                return .green
            case .classEvent:
                return .indigo
            case .clubEvent:
                return .mint
            case .personalEvent:
                return .orange
            }
        }
    
    
    var image: String {
        switch self {
        case .assignment:
            return "square.and.pencil"
        case .classEvent:
            return "rectangle.and.paperclip"
        case .clubEvent:
            return "figure.dance"
        case .personalEvent:
            return "figure.walk.motion"
        }
        
    }
}
