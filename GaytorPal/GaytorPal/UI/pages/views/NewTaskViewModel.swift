//
//  NewTaskViewModel.swift
//  GaytorPal
//
//  Created by David Denis on 3/28/24.
//

import FirebaseAuth
import FirebaseFirestore
import Foundation

class NewTaskViewModel: ObservableObject {
    
    @Published var taskTitle: String = ""
    @Published var dueDate = Date()
    
    init() {}
    
    
    func save() {
        
        guard canSave else {
            return
        }
        
        
        // Get current user ID
        
        // Create Model
        
        // Save Model
    }
    
    var canSave: Bool {
        guard !taskTitle.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty else {
            return false
        }
        
        // Make sure the due date is not 'yesterday'
        guard dueDate >= Date().addingTimeInterval(-86400) else {
            return false
        }
        
        return true
    }
    
}
