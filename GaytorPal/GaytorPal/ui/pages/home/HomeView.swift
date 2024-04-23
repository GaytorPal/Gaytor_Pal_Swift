//
//  HomeView.swift
//  GaytorPal
//
//  Created by David Denis on 2/9/24.
//

import SwiftUI

struct HomeView: View {
    @EnvironmentObject var clubsViewModel: MyClubsViewModel
    
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
                AccountView(viewModel: clubsViewModel)
                    .tabItem {
                        Label("Account", systemImage: "person")
                    }
                
            }
        }
        .ignoresSafeArea()

    }
}

#Preview {
    HomeView()
        .environmentObject(AuthViewModel())
        .environmentObject(MyClubsViewModel())
        
}
