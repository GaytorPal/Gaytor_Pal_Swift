//
//  HomeView.swift
//  GaytorPal
//
//  Created by David Denis on 2/9/24.
//

import SwiftUI

struct HomeView: View {
    
    @StateObject var vm : AuthViewModel
    @StateObject var clubVM: MyClubsViewModel
    
    var body: some View {
        ZStack {
            
            TabView {
                CalendarView(vm: vm)
                    .tabItem {
                        Label("Calendar", systemImage: "calendar").monospaced()
                    }
                
                ClubView(myclubVM: clubVM)
                    .tabItem {
                        Label("Explore", systemImage: "magnifyingglass").monospaced()
                    }
                
                AccountView(viewModel: clubVM, vm: vm)
                    .tabItem {
                        Label("Account", systemImage: "person").monospaced()
                    }
                
            }
            .tint(.blue)
        }
        .ignoresSafeArea()
        
    }
}

#Preview {
    HomeView(vm: AuthViewModel(user: User(id: "123", fullName: "David Denis", email: "denis@ufl.edu", username: "sexo3"), taskVM: TaskViewModel()), clubVM: MyClubsViewModel())
}
