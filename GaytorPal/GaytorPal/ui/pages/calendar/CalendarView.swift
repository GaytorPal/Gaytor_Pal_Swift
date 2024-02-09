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
    
    
    @ObservedObject var vm : AuthViewModel
    
    var body: some View {
        
        VStack {
            HeaderView()
            
            ScrollView {
                
                LazyVStack {
                    
                    TaskView(vm: vm, selectedDate: $currentDate)
                    
                }
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
        .background(.linearGradient(colors: [.black, .gray], startPoint: .topLeading, endPoint: .bottomTrailing))
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
            NewTaskView(vm: vm, currentDate: $currentDate)
                .presentationDetents([.height(400)])
                .presentationCornerRadius(30)
                .padding()
            
            
                .onDisappear(perform: {
                    vm.getAssignments(dueDate: currentDate)
                })
            
        })
        
        .onChange(of: currentDate, perform: { value in
            vm.getAssignments(dueDate: currentDate)
        })
        .onAppear(perform: {
            vm.getAssignments(dueDate: currentDate)
        })
        
        
        
        
        
        
    }
    
    
    /// Header View
    
    @ViewBuilder
    func HeaderView() -> some View {
        
        VStack(alignment: .leading) {
            HStack {
                
                Text(currentDate.isToday ? "Today" : currentDate.format("MMMM"))
                    .foregroundStyle(.blue)
                    .font(.title).monospaced()
                
                Text(currentDate.isToday ? "" : currentDate.format("YYYY"))
                    .foregroundStyle(.white)
                
                
            }
            .font(.title).bold().monospaced()
            
            Text(currentDate.formatted(date: .complete, time: .omitted))
                .font(.caption).monospaced()
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
    CalendarView(vm: AuthViewModel(user: User(id: "123", fullName: "David Denis", email: "denis@ufl.edu", username: "David4"), taskVM: TaskViewModel()))
}
