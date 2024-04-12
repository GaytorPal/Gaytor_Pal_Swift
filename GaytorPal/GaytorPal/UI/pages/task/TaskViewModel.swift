//
//  TaskViewModel.swift
//  GaytorPal
//
//  Created by David Denis on 4/5/24.
//

import Foundation

class TaskViewModel: ObservableObject {
    
    @Published var userTasks: [Assignment] = [
        
        Assignment(taskTitle: "Complete Presentation", taskDescription: "Finish Sprint 1", dueDate: Date(), category: .assignment),
        
        Assignment(taskTitle: "Study", taskDescription: "Differential Equations Exam", dueDate: Date(), category: .assignment),
        
        Assignment(taskTitle: "Register", taskDescription: "Summer and Fall Registration", dueDate: Date(), category: .assignment),
        
        Assignment(taskTitle: "Group Proposal", taskDescription: "Quest 2 Chagas Disease Solution", dueDate: Date(), category: .assignment)
    
    
    
    ]
    @Published var taskTitle: String = ""
    @Published var taskDescription: String = ""
    @Published var taskCategory: TaskCategory = .assignment
    @Published var dueDate = Date()
    @Published var filteredTasks: [Assignment] = []
    
    init() {
        
    }
    
    
    var canSave: Bool {
        guard !taskTitle.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return false
        }
        
        // Make sure the due date is not 'yesterday'
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
    
    
    func createNewTask(task: Assignment) {
        
        guard canSave else {
            return
        }
        
        userTasks.append(task)
        
    }
    
    func todayTasks(_ selectedDate: Date) -> [Assignment] {
        
        DispatchQueue.global(qos: .userInteractive).async {
            
            let calendar = Calendar.current
            let filtered = self.userTasks.filter {
                return calendar.isDate($0.dueDate, inSameDayAs: selectedDate)
            }
            DispatchQueue.main.async {
                self.filteredTasks = filtered
            }
        }
        
        
        
        
        return self.filteredTasks
    }
    
    
    
}
