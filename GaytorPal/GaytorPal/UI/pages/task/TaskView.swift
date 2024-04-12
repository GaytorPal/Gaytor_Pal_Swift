//
//  TaskView.swift
//  GaytorPal
//
//  Created by David Denis on 4/5/24.
//

import SwiftUI

struct TaskView: View {
    @ObservedObject var taskModel: TaskViewModel
    
    @Binding var selectedDate: Date
    
    
    var body: some View {
        
        VStack {
            ForEach(taskModel.todayTasks(selectedDate)) { task in
                TaskCardView(task: task)
            }
           
            
        }
        
    }
    
}

#Preview {
    TaskView(taskModel: TaskViewModel(), selectedDate: .constant(Date.init()))
    
    /*
    TaskView(taskModel: TaskViewModel(userTasks: [
    
        Assignment(taskTitle: "Complete Presentation", taskDescription: "Finish Sprint 1", dueDate: Date.init(), category: .assignment),
        
        Assignment(taskTitle: "Study", taskDescription: "Differential Equations Exam", dueDate: Date(), category: .assignment),
        
        Assignment(taskTitle: "Register", taskDescription: "Summer and Fall Registration", dueDate: Date.init(), category: .assignment),
        
        Assignment(taskTitle: "Group Proposal", taskDescription: "Quest 2 Chagas Disease Solution", dueDate: Date.init(), category: .assignment)
    
    
    
    
    
    ]))
     */
}
