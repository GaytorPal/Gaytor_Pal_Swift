//
//  TaskCardView.swift
//  GaytorPal
//
//  Created by David Denis on 3/29/24.
//

import SwiftUI

struct TaskCardView: View {
    
    @State var task: Assignment
    
    @State var done: Bool = false
    
    @ObservedObject var vm: AuthViewModel
    
    @State private var isVisible: Bool = false
    
    @State private var timeVisible: Bool = false
    
    @State var showModify: Bool = false
    
    var body: some View {
        
        HStack(alignment: .center) {
            
            VStack {
                Button {
                    
                    
                    vm.toggleAssignment(taskID: task.id)
                    
                    //done.toggle()
                    
                    
                    withAnimation {
                        //isVisible.toggle() // Hide the card
                        task.completed.toggle()
                    }
                    
                    
                    
                    /*
                    // Remove the task after a short delay
                    DispatchQueue.main.asyncAfter(deadline: .now() + 2) {
                        vm.taskVM.removeTask(task)
                    }
                     */
                    
                    
                    
                    
                } label: {
                    Image(systemName: task.completed ? "checkmark.circle.fill" : "circle")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundStyle(task.category.color)
                }
                
                Rectangle()
                    .fill(LinearGradient(colors: [.clear, task.category.color], startPoint: .bottom, endPoint: .top))
                    .frame(width: 3)
                
                
                
                
            }
            VStack {
                
                
                /// TIMER BUTTON
                
                Button(action: {
                    
                    timeVisible.toggle()
                    
                }, label: {
                    
                    ZStack {
                        LinearGradient(colors: [.black, task.category.color], startPoint: .bottom, endPoint: .top)
                            .clipShape(RoundedRectangle(cornerRadius: 20))
                        
                        if timeVisible && isVisible {
                            TimerCountdownView(timer: TimerCountdownViewModel(dueDate: task.dueDate))
                        }
                    }
                    
                })
                .frame(width: 200, height: 8)
                .clipShape(RoundedRectangle(cornerRadius: 10))
                
                
                
                /// ASSIGNMENT INFO
                
                HStack(alignment: .center) {
                    
                    VStack {
                        
                        Button(action: {
                            
                            showModify = true
                            
                        }, label: {
                            
                            ZStack {
                                
                                Image(systemName: "square.and.pencil")
                                    .font(.title3)
                                    .foregroundStyle(.primary)
                                
                            }
                            
                        })
                        .frame(width: 30, height: 30)
                        .clipShape(RoundedRectangle(cornerRadius: 10))
                        
                        
                        
                        
                        HStack {
                            Image(systemName: "clock")
                            Text(task.dueDate.format("hh:mm"))
                        }
                        .font(.caption).fontWeight(.semibold).monospaced()
                        
                    }
                    .padding(.trailing)
                    
                    VStack(alignment: .leading, spacing: 5) {
                        Text(task.taskTitle)
                            .font(.title3).bold().monospaced()
                            .strikethrough(task.completed)
                        
                        Text(task.taskDescription)
                            .font(.footnote).monospaced()
                            .strikethrough(task.completed)
              
                    }
                    
                    
                    /// MODIFIERS
                    
                    
                }
                .hSpacing(.leading)
                
            }
            .padding()
            .background(
                
                LinearGradient(colors: [.clear, task.category.color], startPoint: .bottom, endPoint: .top)
                    .clipShape(RoundedRectangle(cornerRadius: 20))
            )
        }
        
        .sheet(isPresented: $showModify, content: {
            ModifyTaskView(vm: vm, title: task.taskTitle, description: task.taskDescription, dueDate: task.dueDate, category: task.category)
            
                .presentationDetents([.height(400)])
                .presentationCornerRadius(30)
                .padding()
        })
        
        
        .onAppear {
            self.isVisible = true
        }
        .opacity(!task.completed ? 1 : 0.35)
        
        .animation(Animation.easeIn(duration: 0.45), value: !task.completed)
        
        
        .padding()
        
        
        .frame(maxWidth: .infinity)
                .onAppear {
                    self.isVisible = true
                }
        
    
    }

    
}

#Preview {
    TaskCardView(task: Assignment(taskTitle: "HW 15", taskDescription: "Do exercises 1-6 from Section 12.7 of the book.", dueDate: Calendar.current.date(byAdding: .day, value: 2, to: Date())!, category: .classEvent),
                 vm: AuthViewModel(user: User(id: "123", fullName: "David Denis", email: "denis@ufl.edu", username: "David"), taskVM: TaskViewModel()))
    
        .preferredColorScheme(.dark)
}
