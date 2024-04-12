//
//  NewTaskView.swift
//  GaytorPal
//
//  Created by David Denis on 3/28/24.
//

import SwiftUI

struct NewTaskView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var taskModel: TaskViewModel
    @Environment(\.colorScheme) var colorScheme
    
    
    
    var body: some View {
        
        /// TITLE
        
        VStack(alignment: .leading, spacing: 10) {
            
            
            Button(action: {
                dismiss()
            }, label: {
                Image(systemName: "xmark.circle.fill")
                    .font(.title)
                    .tint(.red)
            })
            .hSpacing(.trailing)
            
            VStack(alignment: .leading, spacing: 8, content: {
                Text("Task Title")
                    .font(.caption).bold()
                    .foregroundStyle(.gray)
                
                
                
                HStack {
                    
                    Image(systemName: "list.dash.header.rectangle")
                        .frame(width: 30, height: 10)
                        .padding(.horizontal)
                    
                    TextField("", text: $taskModel.taskTitle)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 15)
                        .background(.white.shadow(.drop(color: .black.opacity(0.25), radius: 2)), in: .rect(cornerRadius: 10))
                        .foregroundStyle(.black)
                }
            })
            .padding(.top, 5)
            
            
            /// DESCRIPTION
            
            VStack(alignment: .leading, spacing: 10, content: {
                Text("Description")
                    .font(.caption).bold()
                    .foregroundStyle(.gray)
                
                HStack {
                    
                    Image(systemName: "rectangle.and.pencil.and.ellipsis")
                        .frame(width: 30, height: 10)
                        .padding(.horizontal)
                    
                    Spacer()
                    
                    TextField("", text: $taskModel.taskDescription)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 15)
                        .background(.white.shadow(.drop(color: .black.opacity(0.25), radius: 2)), in: .rect(cornerRadius: 10))
                        .foregroundStyle(.black)
                    
                        
                }
            })
            .padding(.top, 5)
            
            
            /// DATE
            
            HStack(spacing: 12) {
                
                VStack(alignment: .leading, spacing: 10) {
                    
                    Text("Due Date")
                        .font(.caption).bold()
                        .foregroundStyle(.gray)
                    
                    HStack {
                        
                        Image(systemName: "calendar.badge.clock")
                            .frame(width: 27, height: 10)
                            .padding(.horizontal)
                        
                        DatePicker("", selection: $taskModel.dueDate)
                            .datePickerStyle(.compact)
                            .scaleEffect(1, anchor: .topLeading)
                            .padding(.bottom, 10)
                        
                            
                        
                        
                        
                        
                    }
                }
                .padding(.top, 5)
                .padding(.trailing, -15)
                
                Spacer()
                Spacer()
                Spacer()
                Spacer()
                
                
                
                
                
                /// CATEGORY Option
                /*
                 VStack(alignment: .leading) {
                 
                 Text("Task Category")
                 .font(.caption).bold()
                 .foregroundStyle(.gray)
                 
                 
                 HStack {
                 ForEach(TaskCategory.allCases, id: \.self) { category in
                 
                 Button(action: {
                 taskModel.taskCategory = category
                 }) {
                 Circle()
                 .fill(category.color)
                 .frame(width: 25, height: 25)
                 .overlay(
                 Circle().stroke(taskModel.taskCategory == category ? Color.black : Color.clear, lineWidth: 2)
                 )
                 }
                 
                 .padding(.top, 5)
                 
                 Spacer(minLength: 0)
                 
                 
                 }
                 
                 
                 
                 }
                 
                 }
                 */
                
                
                
            }
            
            Button(action: {
                
                taskModel.createNewTask(task: Assignment(taskTitle: taskModel.taskTitle, taskDescription: taskModel.taskDescription, dueDate: taskModel.dueDate, category: taskModel.taskCategory))
                
                dismiss()
                
            }, label: {
                Text("Save")
                    .font(.title)
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                    .textScale(.secondary)
                    .hSpacing(.center)
                    .padding(.vertical, 12)
                    .background(.blue, in: .rect(cornerRadius: 20))
                
            })
            
        }
        .padding(.horizontal)
        
    }
}

#Preview {
    NewTaskView(taskModel: .init())
        .vSpacing(.bottom)
}
