//
//  WeekView.swift
//  GaytorPal
//
//  Created by David Denis on 3/28/24.
//

import SwiftUI

struct WeekView: View {
    
    var week: [Date.Weekday]
    @Binding var currentDate: Date
    
    var body: some View {
        
        HStack {
            ForEach(week) {day in
                
                
                
                VStack(spacing: 8){
                    Text(day.date.format("E"))
                        .font(.subheadline).monospaced()
                        .textScale(.secondary)
                        .fontWeight(.semibold)
                        .foregroundStyle(.white)
                    
                    
                    Text(day.date.format("dd"))
                        .font(.callout).monospaced()
                        .textScale(.secondary)
                        .fontWeight(.bold)
                        .frame(width: 35, height: 35)
                        .foregroundStyle(isSameDate(day.date, currentDate) ? .white : .black)
                        .background(content: {
                            if isSameDate(day.date, currentDate) {
                                RoundedRectangle(cornerRadius: 25)
                                    .fill(.blue)
                            }
                            
                            if day.date.isToday {
                                Circle()
                                    .fill(.white)
                                    .frame(width: 5, height: 5)
                                    .vSpacing(.bottom)
                                    .offset(y: 12)
                                    
                            }
                        })
                        .background(.white.shadow(.drop(radius: 1)), in: .rect(cornerRadius: 25))
                        
                    
                        
                }
                .hSpacing(.center)
                .contentShape(.rect)
                .padding(5)
                .onTapGesture {
                    /// Updating Current Date
                    withAnimation(.easeIn) {
                        currentDate = day.date
                    }
                }
            }
            
            
            
            
            
        }
 
        
        
    }
}

#Preview {
    WeekView(week: [Date.Weekday(date: Date.init())], currentDate: .constant(Date.init()))
        
        .preferredColorScheme(.dark)
}
