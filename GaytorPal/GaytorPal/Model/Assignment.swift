//
//  Task.swift
//  GaytorPal
//
//  Created by David Denis on 3/29/24.
//

import Foundation
import SwiftUI

struct Assignment: Identifiable, Codable {
    
    var id = UUID()
    var taskTitle: String
    var taskDescription: String
    var dueDate: Date
    var category: TaskCategory
    
}


enum TaskCategory: String, Codable, CaseIterable, Identifiable, Hashable {
    
    case assignment
    case classEvent
    case clubEvent
    case personalEvent
    
    var id: Self {self}
    
    var color: Color {
            switch self {
            case .assignment:
                return .blue
            case .classEvent:
                return .green
            case .clubEvent:
                return .yellow
            case .personalEvent:
                return .purple
            }
        }
}
