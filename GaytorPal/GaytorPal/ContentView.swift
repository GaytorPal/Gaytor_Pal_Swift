//
//  ContentView.swift
//  GaytorPal
//
//  Created by David Denis on 2/9/24.
//

import SwiftUI

struct ContentView: View {
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Group {
            if viewModel.userSession != nil {
                HomeView()
            } else {
                SignInView()
            }
        }
        
    }
}

#Preview {
    CalendarView(taskModel: TaskViewModel())
        .environmentObject(AuthViewModel())
}
