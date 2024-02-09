//
//  TaskViewModel.swift
//  GaytorPal
//
//  Created by David Denis on 4/5/24.
//

import Foundation

class TaskViewModel: ObservableObject {
    
    // Private variables like the Apollo endpoint
    //private var requestHandler = RequestHandler()
    
    @Published var userTasks: [Assignment] = [
        
        /*
        Assignment(taskTitle: "Complete Presentation", taskDescription: "Finish Sprint 1", dueDate: Calendar.current.date(byAdding: .day, value: 2, to: Date())!, category: .assignment),
        
        Assignment(taskTitle: "Study", taskDescription: "Differential Equations Exam", dueDate: Calendar.current.date(byAdding: .hour, value: 2, to: Date())!, category: .personalEvent),
        
        Assignment(taskTitle: "Register", taskDescription: "Summer and Fall Registration", dueDate: Calendar.current.date(byAdding: .day, value: 1, to: Date())!, category: .classEvent),
        
        Assignment(taskTitle: "Group Proposal", taskDescription: "Quest 2 Chagas Disease Solution", dueDate: Date(), category: .clubEvent)
    
    */
    
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
        
        taskTitle = task.taskTitle
        dueDate = task.dueDate
        
        guard canSave else {
            return
        }
        
        
        
    }
    
    func todayTasks(_ selectedDate: Date) {
        
        DispatchQueue.global(qos: .userInteractive).async {
            
            let calendar = Calendar.current
            let filtered = self.userTasks.filter {
                return calendar.isDate($0.dueDate, inSameDayAs: selectedDate)
            }
            DispatchQueue.main.async {
                self.filteredTasks = filtered
            }
        }
        
        
      
    }
    
    
    func removeTask(_ task: Assignment) {
        
        if let index = userTasks.firstIndex(where: { $0 == task }) {
            userTasks.remove(at: index)
        }

        
        
        
    }
    
    
    
}
