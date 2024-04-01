//
//  RegisterViewModel.swift
//  GaytorPal
//
//  Created by David Denis on 2/9/24.
//

import Foundation
import Firebase
import FirebaseFirestoreSwift

protocol AuthenticationFormProtocol {
    var formIsValid: Bool { get }
}

@MainActor
class AuthViewModel: ObservableObject {
    
    // will tell us whether or not we have a user logged in (profile or log in page)
    @Published var userSession: FirebaseAuth.User?
    
    // our user
    @Published var currentUser: User?
    
    // wrong credentials
    @Published var showError = false
    var errorMessage = ""
    
    init() {
        self.userSession = Auth.auth().currentUser
        
        Task {
            await fetchUser()
        }
    }
    
    // display error message with desired text
    func showError(message: String) {
        self.errorMessage = message
        showError = true
    }
    
    // signs in (async tutorial --> watch it)
    func signIn(withEmail email: String, password: String) async throws {
        do {
            let result = try await Auth.auth().signIn(withEmail: email, password: password)
            self.userSession = result.user
            await fetchUser()
        } catch {
            showError(message: "Wrong Credentials. Please Try Again.")
            print("DEBUG: Failed to log in with error \(error.localizedDescription)")
        }
    }
    
    func createUser(withEmail email: String, password: String, fullname: String) async throws {
        do {
            let result = try await Auth.auth().createUser(withEmail: email, password: password)
            self.userSession = result.user
            let user = User(id: result.user.uid, fullName: fullname, email: email)
            let encodedUser = try Firestore.Encoder().encode(user)
            try await Firestore.firestore().collection("users").document(user.id).setData(encodedUser)
            await fetchUser()
        } catch {
            showError(message: "There was an error. Please Try Again.")
            print("DEBUG: Failed to create user with error \(error.localizedDescription)")
        }
    }
    
    func signOut() {
        do {
            try Auth.auth().signOut()       // signs out user on backend
            self.userSession = nil          // wipes out user session and takes us back to login view
            self.currentUser = nil          // wipes out current user data model
        } catch {
            showError(message: "There was an error. Please Try Again.")
            print("DEBUG: Failed to sign out with error \(error.localizedDescription)")
        }
    }
    
    func deleteAccount() {
        
        
        let user = Auth.auth().currentUser
        user?.delete() { error in
            if let error = error {
                self.showError(message: "There was an error. Please Try Again.")
                print("DEBUG: Failed to delete user account with error \(error.localizedDescription)")
            } else {
                self.userSession = nil          // wipes out user session and takes us back to login view
                self.currentUser = nil          // wipes out current user data model
                print("Deleted")
            }
        }
        
        
        
    }
    
    func fetchUser() async {
        guard let uid = Auth.auth().currentUser?.uid else { return }
        guard let snapshot = try? await Firestore.firestore().collection("users").document(uid).getDocument() else { return }
        self.currentUser = try? snapshot.data(as: User.self)
        
        print("DEBUG: Current user is \(self.currentUser)")
    }
}
