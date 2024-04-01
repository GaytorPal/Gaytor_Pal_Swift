//
//  HomeView.swift
//  GaytorPal
//
//  Created by David Denis on 2/9/24.
//

import SwiftUI

struct HomeView: View {
    
    let user: User = User.MOCK_USER
    
    var body: some View {
        ZStack {
            
            TabView {
                CalendarView()
                    .tabItem {
                        Label("Calendar", systemImage: "calendar")
                    }
                
                ClubView()
                    .tabItem {
                        Label("Explore", systemImage: "magnifyingglass")
                    }
                
            }
        }
        .ignoresSafeArea()

    }
}

#Preview {
    HomeView()
        .environmentObject(AuthViewModel())
}
