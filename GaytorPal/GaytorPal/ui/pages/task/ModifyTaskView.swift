//
//  ModifyTaskView.swift
//  GaytorPal
//
//  Created by David Denis on 4/24/24.
//

import SwiftUI

struct ModifyTaskView: View {
    @Environment(\.dismiss) private var dismiss
    @ObservedObject var vm: AuthViewModel
    @Environment(\.colorScheme) var colorScheme
    
    //@Binding var currentDate: Date
    
    /// NEW TASK ATTRIBUTES
    
    @State var title: String = ""
    @State var description: String = ""
    @State var dueDate: Date = Date()
    @State var category: TaskCategory = .assignment
    
    
    var body: some View {
        
        /// TITLE
        
        VStack(alignment: .leading, spacing: 10) {
            
            HStack(alignment: .center) {
                
                Text("Modify Task")
                    .font(.title3).bold().monospaced()
                    .foregroundStyle(.black)
                
                Button(action: {
                    dismiss()
                }, label: {
                    Image(systemName: "xmark.circle.fill")
                        .font(.title)
                        .tint(.red)
                })
                .hSpacing(.trailing)
            }
            VStack(alignment: .leading, spacing: 8, content: {
                Text("Task Title")
                    .font(.caption).bold().monospaced()
                    .foregroundStyle(.gray)
                
                
                
                HStack {
                    
                    Image(systemName: "list.dash.header.rectangle")
                        .frame(width: 30, height: 10)
                        .padding(.horizontal)
                    
                    TextField("", text: $title)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 15)
                        .font(.footnote).monospaced()
                        .background(.white.shadow(.drop(color: .black.opacity(0.25), radius: 2)), in: .rect(cornerRadius: 10))
                        .foregroundStyle(.black)
                }
            })
            .padding(.top, 5)
            
            
            /// DESCRIPTION
            
            VStack(alignment: .leading, spacing: 10, content: {
                Text("Description")
                    .font(.caption).bold().monospaced()
                    .foregroundStyle(.gray)
                
                HStack {
                    
                    Image(systemName: "rectangle.and.pencil.and.ellipsis")
                        .frame(width: 30, height: 10)
                        .padding(.horizontal)
                    
                    Spacer()
                    
                    TextField("", text: $description)
                        .padding(.vertical, 12)
                        .padding(.horizontal, 15)
                        .font(.footnote).monospaced()
                        .background(.white.shadow(.drop(color: .black.opacity(0.25), radius: 2)), in: .rect(cornerRadius: 10))
                        .foregroundStyle(.black)
                    
                    
                }
            })
            .padding(.top, 5)
            
            
            /// DATE
            
            HStack(alignment: .top) {
                
                VStack(alignment: .leading, spacing: 0) {
                    
                    Text("Due Date").monospaced()
                        .font(.caption).bold()
                        .foregroundStyle(.gray)
                    
                    HStack {
                        
                        Image(systemName: "calendar.badge.clock")
                            .frame(width: 27, height: 10)
                            .padding(.horizontal)
                        
                        DatePicker("", selection: $dueDate)
                            .font(.footnote).monospaced()
                            .datePickerStyle(.compact)
                            .scaleEffect(0.8, anchor: .topLeading)
                            
                        
                        
                        
                        
                        
                        
                    }
                    
                }
                
                .padding(.trailing, -20)
                
                
                
                
                
                
                
                
                /// CATEGORY Option
                
                VStack(alignment: .leading) {
                    
                    Text("Task Category")
                        .font(.caption).bold().monospaced()
                        .foregroundStyle(.gray)
                    
                    
                    
                    HStack {
                        ForEach(TaskCategory.allCases, id: \.self) { category in
                            
                            Button(action: {
                                self.category = category
                            }) {
                                Circle()
                                    .fill(category.color)
                                    .frame(width: 20, height: 20)
                                    .overlay(
                                        Circle().stroke(self.category == category ? Color.black : Color.clear, lineWidth: 2)
                                    )
                            }
                            
                        }
                        .padding(.bottom, 5)
                        
                        
                        
                    }
                    
                }
                
                
                
                
            }
            
            
            Button(action: {
                
                print(title)
                
                vm.addAssignment(task: Assignment(taskTitle: title, taskDescription: description, dueDate: dueDate, category: category))
                
                
                
                //vm.getAssignments(dueDate: currentDate)
                
                dismiss()
                
            }, label: {
                Text("Save \(category.rawValue)")
                    .font(.title2).monospaced()
                    .foregroundStyle(.white)
                    .fontWeight(.bold)
                    .textScale(.secondary)
                    .hSpacing(.center)
                    .padding(.vertical, 12)
                    .background(category.color, in: .rect(cornerRadius: 20))
                
            })
            .animation(.smooth)
            
            
        }
        .padding(.horizontal)
        
    }
}

#Preview {
    ModifyTaskView(vm: AuthViewModel(user: User(id: "123", fullName: "David Denis", email: "denis@ufl.edu", username: "David"), taskVM: TaskViewModel()))
        .vSpacing(.bottom)
}
