//
//  User.swift
//  GaytorPal
//
//  Created by David Denis on 3/26/24.
//

import Foundation

struct User: Identifiable, Codable {
    
    let id: String
    let fullName: String
    let email: String
    
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

extension User {
    static var MOCK_USER = User(id: NSUUID().uuidString, fullName: "David Denis", email: "daviddenis113004@gmail.com")
}
