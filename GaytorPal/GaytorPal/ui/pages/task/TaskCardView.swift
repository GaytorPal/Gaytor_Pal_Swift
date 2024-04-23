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
    
    var body: some View {
        
        HStack(alignment: .center) {
            
            VStack {
                Button {
                    // pass
                    done.toggle()
                } label: {
                    Image(systemName: done ? "checkmark.circle.fill" : "circle")
                        .resizable()
                        .frame(width: 25, height: 25)
                        .foregroundStyle(.black)
                }
                
                Rectangle()
                    .fill(.black)
                    .frame(width: 3)
                
                
                
                
            }
            VStack {
                
                HStack(alignment: .top) {
   
                    VStack(alignment: .leading, spacing: 5) {
                        Text(task.taskTitle)
                            .font(.title3).bold()
                        
                        Text(task.taskDescription)
                            .font(.footnote)
                        
                        HStack {
                            Image(systemName: "clock")
                            Text(task.dueDate.format("hh:mm"))
                        }
                        .font(.footnote)
                    }
                    
                    
                    
                    
                }
                .hSpacing(.leading)
                
            }
            .padding()
            .background(
            
                Color(.lightGray)
                    .clipShape(RoundedRectangle(cornerRadius: 25))
            )
        }
        .padding()
    }
    
}

#Preview {
    TaskCardView(task: Assignment(taskTitle: "HW 15", taskDescription: "Do exercises 1-6 from Section 12.7 of the book.", dueDate: Date.init()))
}
