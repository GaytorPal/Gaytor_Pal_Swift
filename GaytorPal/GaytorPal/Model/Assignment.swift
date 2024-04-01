//
//  Task.swift
//  GaytorPal
//
//  Created by David Denis on 3/29/24.
//

import Foundation

struct Assignment: Identifiable, Codable {
    
    var id = UUID()
    var taskTitle: String
    var taskDescription: String
    var dueDate: Date
    
}
