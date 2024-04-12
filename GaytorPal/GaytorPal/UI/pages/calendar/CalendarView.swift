//
//  CalendarView.swift
//  GaytorPal
//
//  Created by David Denis on 3/28/24.
//

import SwiftUI

struct CalendarView: View {
    
    @State private var currentDate: Date = Date()
    @State private var weekSlider: [[Date.Weekday]] = []
    @State private var currentWeekIndex: Int = 1
    @State private var changedWeek: Bool = false
    @State private var createNewTask: Bool = false
    
    
    @ObservedObject var taskModel: TaskViewModel
    
    var body: some View {
        
        VStack {
            HeaderView()
            
            ScrollView {
                
                
                
                TaskView(taskModel: taskModel, selectedDate: $currentDate)
                    
            }
            
            
            
        }
        .vSpacing(.top)
        .overlay(alignment: .bottomTrailing, content: {
            
            Button(action: {
                createNewTask.toggle()
            }, label: {
                Image(systemName: "plus")
                    .fontWeight(.semibold)
                    .foregroundStyle(.black)
                    .frame(width: 50, height: 50)
                    .background(.white, in: .circle)
            })
            .padding(15)
            
        })
        .background(.linearGradient(colors: [.black, .cyan], startPoint: .topLeading, endPoint: .bottomTrailing))
        .onAppear(perform: {
            if weekSlider.isEmpty {
                let currentWeek = Date().fetchWeek()
                
                if let firstDate = currentWeek.first?.date {
                    weekSlider.append(firstDate.createPreviousWeek())
                }
                
                weekSlider.append(currentWeek)
                
                if let lastDate = currentWeek.last?.date {
                    weekSlider.append(lastDate.createNextWeek())
                }
                
            }
        })
        .sheet(isPresented: $createNewTask, content: {
            NewTaskView(taskModel: taskModel)
                .presentationDetents([.height(400)])
                .presentationCornerRadius(30)
                .padding()
            
        })
        
        
        
        
        
        
        
        
    }
    
    
    /// Header View
    
    @ViewBuilder
    func HeaderView() -> some View {
        
        VStack(alignment: .leading) {
            HStack {
                
                Text(currentDate.isToday ? "Today" : currentDate.format("MMMM"))
                    .foregroundStyle(currentDate.isToday ? .blue : .white)
                
                Text(currentDate.isToday ? "" : currentDate.format("YYYY"))
                    .foregroundStyle(.white)
                
                
            }
            .font(.title.monospaced()).bold()
            
            Text(currentDate.formatted(date: .complete, time: .omitted))
                .font(.caption)
                .fontWeight(.semibold)
                .textScale(.secondary)
                .foregroundStyle(.white)
            
            
            /// Week Slider
            
            TabView(selection: $currentWeekIndex) {
                ForEach(weekSlider.indices, id: \.self) { index in
                    let week = weekSlider[index]
                    WeekView(week: week, currentDate: $currentDate)
                        .padding(.horizontal, 15)
                        .tag(index)
                }
            }
            .padding(.horizontal, -15)
            .tabViewStyle(.page(indexDisplayMode: .never))
            
            .frame(height: 100)
            
        }
        .padding()
        .hSpacing(.leading)
        .onChange(of: currentWeekIndex, initial: false) { oldValue, newValue in
            
            /// Generate Weeks when the user slides to a new week
            if newValue == 0 || newValue == (weekSlider.count - 1) {
                
                paginateWeek()
                
            }
        }
    }
    
    func paginateWeek() {
        
        if weekSlider.indices.contains(currentWeekIndex) {
            
            if let firstDate = weekSlider[currentWeekIndex].first?.date, currentWeekIndex == 0 {
                // Inserting new week at 0th and removing last array item
                weekSlider.insert(firstDate.createPreviousWeek(), at: 0)
                weekSlider.removeLast()
                currentWeekIndex = 1
            }
            
            if let lastDate = weekSlider[currentWeekIndex].last?.date, currentWeekIndex == (weekSlider.count - 1) {
                // Appending new week at last index and removing first element
                weekSlider.append(lastDate.createNextWeek())
                weekSlider.removeFirst()
                currentWeekIndex = weekSlider.count - 2
            }
            
            
        }
        
    }
}

#Preview {
    CalendarView(taskModel: TaskViewModel())
}
