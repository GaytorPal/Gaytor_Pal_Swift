//
//  TaskView.swift
//  GaytorPal
//
//  Created by David Denis on 4/5/24.
//

import SwiftUI

struct TaskView: View {
    @ObservedObject var vm : AuthViewModel
    
    @Binding var selectedDate: Date
    
    
    var body: some View {
        
        LazyVStack {
            ForEach(vm.taskVM.userTasks) { task in
                
                TaskCardView(task: task, vm: vm)
                    .swipeActions(edge: .trailing, allowsFullSwipe: true) {
                                    Button(role: .destructive) {
                                        withAnimation {
                                            // PASS
                                        }
                                    } label: {
                                        Label("Delete", systemImage: "trash")
                                    }
                                }
            }
            
           
            
        }
        
        
        
        
    }
    
}

#Preview {
    TaskView(vm: AuthViewModel(user: User(id: "123", fullName: "David Denis", email: "denis@ufl.edu", username: "David"), taskVM: TaskViewModel()), selectedDate: .constant(Calendar.current.date(byAdding: .day, value: 1, to: Date())!))
    
    /*
    TaskView(taskModel: TaskViewModel(userTasks: [
    
        Assignment(taskTitle: "Complete Presentation", taskDescription: "Finish Sprint 1", dueDate: Date.init(), category: .assignment),
        
        Assignment(taskTitle: "Study", taskDescription: "Differential Equations Exam", dueDate: Date(), category: .assignment),
        
        Assignment(taskTitle: "Register", taskDescription: "Summer and Fall Registration", dueDate: Date.init(), category: .assignment),
        
        Assignment(taskTitle: "Group Proposal", taskDescription: "Quest 2 Chagas Disease Solution", dueDate: Date.init(), category: .assignment)
    
    
    
    
    
    ]))
     */
}
