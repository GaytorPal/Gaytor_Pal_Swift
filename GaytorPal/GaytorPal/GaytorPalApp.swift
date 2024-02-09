//
//  GaytorPalApp.swift
//  GaytorPal
//
//  Created by David Denis on 2/9/24.
//

import SwiftUI


@main
struct GaytorPalApp: App {
    var body: some Scene {
        WindowGroup {
            ContentView(vm : AuthViewModel(user: User(id: "123", fullName: "David Denis", email: "denis@ufl.edu", username: "David"), taskVM: TaskViewModel()), clubVM: MyClubsViewModel())
                
        }
    }
}
