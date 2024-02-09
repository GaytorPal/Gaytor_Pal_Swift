//
//  ContentView.swift
//  GaytorPal
//
//  Created by David Denis on 2/9/24.
//

import SwiftUI

struct ContentView: View {
    
    @ObservedObject var vm : AuthViewModel
    @StateObject var clubVM: MyClubsViewModel
    
    var body: some View {
        
        
        if vm.loggedIn {
            HomeView(vm: vm, clubVM: clubVM)
        } else {
            SignInView(vm: vm )
        }
        
        
        
    }
}

#Preview {
    ContentView(vm: AuthViewModel(user: User(id: "123", fullName: "David Denis", email: "denis@ufl.edu", username: "David"), taskVM: TaskViewModel()), clubVM: MyClubsViewModel())
}
