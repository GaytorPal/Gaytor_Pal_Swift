//
//  User.swift
//  GaytorPal
//
//  Created by David Denis on 3/26/24.
//

import Foundation

class User: Identifiable {
    
    var id: String
    var fullName: String
    var email: String
    var username: String
    var followingClubs: [Club]
    
    
    init(id: String, fullName: String, email: String, username: String) {
        self.id = id
        self.fullName = fullName
        self.email = email
        self.username = username
        self.followingClubs = []
    }
    
    
    // Get Initials (APPLE HELP)
    var initials: String {
        let formatter = PersonNameComponentsFormatter()
        if let components = formatter.personNameComponents(from: fullName) {
            formatter.style = .abbreviated
            return formatter.string(from: components)
        }
        
        return ""
    }
    
    
}


