//
//  MyClubsViewModel.swift
//  GaytorPal
//
//  Created by Leonardo Cobaleda on 4/22/24.
//

import Foundation

import SwiftUI

class MyClubsViewModel: ObservableObject {
    @Published var myClubs: [Club] = []
    
    
    func addClub(_ club: Club) {
        if !myClubs.contains(where: { $0.name == club.name }) {
            myClubs.append(club)
            print("Club added: \(club.name)")
        } else {
            print("Club already exists: \(club.name)")
        }
    }
}
