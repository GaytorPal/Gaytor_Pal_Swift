//
//  ClubViewModel.swift
//  GaytorPal
//
//  Created by Leonardo Cobaleda on 4/24/24.
//

import Foundation

struct Club: Identifiable {
    let id: String
    let name: String
    let fullName: String
    let description: String
    let categories: Set<String>
    let imageName: String
}

class ClubViewModel: ObservableObject {
    @Published var clubs: [Club] = []
    @Published var errorMessage: String?
    
    private var requestHandler = RequestHandler()

    func loadClubs() {
        requestHandler.getAllClubs { clubs, error in
            DispatchQueue.main.async {
                if let error = error {
                    self.errorMessage = error.localizedDescription
                } else {
                    self.clubs = clubs
                }
            }
        }
    }
}
