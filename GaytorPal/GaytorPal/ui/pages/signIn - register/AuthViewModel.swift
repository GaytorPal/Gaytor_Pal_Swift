//
//  RegisterViewModel.swift
//  GaytorPal
//
//  Created by David Denis on 2/9/24.
//

import Foundation

protocol AuthenticationFormProtocol {
    var formIsValid: Bool { get }
}

@MainActor
final class AuthViewModel: ObservableObject, Observable {
    // Private variables like the Apollo endpoint
    private var requestHandler = RequestHandler()
    
    // Out of View variables (Models)
    @Published var user: User
    @Published var taskVM: TaskViewModel
    
    
    init(user: User, taskVM: TaskViewModel) {
        self.user = user
        self.email = user.email
        self.username = user.username
        self.id = user.id
        
        self.taskVM = taskVM
    }
    
    @Published var email : String
    @Published var username: String
    @Published var id: String
    
    @Published var loggedIn: Bool = false
    
    
    func login(username: String, password: String)
    {
        requestHandler.signIn(username: username, password: password) { data in
            // Check that no error was detected
            if data["error"] == nil
            {
                // Check if all the data is there and is the correct Type
                if let email = data["email"] as? String,
                   let username = data["username"] as? String,
                   let userID = data["id"] as? String
                {
                    
                    // Do something with the data
                    self.user.email = email //Update the model
                    self.user.id = userID
                    self.user.username = username
                    
                    self.email = email
                    self.id = userID
                    self.username = username
                    
                    self.loggedIn = true
                    
                    
                    
                    
                }
                else
                {
                    // Handle missing data error
                    print("Incorrect data")
                }
            }
            else
            {
                // Handle error response
                print(data["error"]!)
            }
        }
    }
    
    func register(username: String, password: String, email: String) {
        requestHandler.registerUser(username: username, password: password, email: email) { data in
            // Check that no error was detected
            if data["error"] == nil
            {
                // Check if all the data is there and is the correct Type
                if let email = data["email"] as? String,
                   let username = data["username"] as? String,
                   let userID = data["id"] as? String
                {
                    
                    self.user.email = email //Update the model
                    self.user.id = userID
                    self.user.username = username
                    
                    self.email = email
                    self.id = userID
                    self.username = username
                    
                    self.loggedIn = true
                    
                    
                    
                }
                else
                {
                    // Handle missing data error
                    print("Incorrect data")
                }
            }
            else
            {
                // Handle error response
                print(data["error"]!)
            
            }
        }
        
        
    }
    
    
    func addAssignment(task: Assignment) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM-dd-yyyy HH:mm"
       
        let date = dateFormatter.string(from: task.dueDate)

        requestHandler.addAssignment(usernameX: username, title: task.taskTitle, description: task.taskDescription, dueDate: date, category: task.category.rawValue) { data in
            
            // Check that no error was detected
            if data["error"] == nil
            {
                // Check if all the data is there and is the correct Type
                print("success task added")
                
            }
            else
            {
                // Handle error response
                print(data["error task not added"] ?? "NO")
                
            }
        }
    }
    
    
    func getAssignments(dueDate: Date) {
        
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "MM/dd/yyyy"
       
        
        let date = dateFormatter.string(from: dueDate)
        
        
        requestHandler.getUserAssignments(userId: username, date: date) {
                
            data in
            
            if data["error"] == nil
            {
                if let tasks = data["assignments"] as? [Assignment] {
                    
                    // Check if all the data is there and is the correct Type
                    print("success got tasks")
                    
                    DispatchQueue.main.async {
                        self.updateTasks(newTasks: tasks)
                    }
                }
            }
            else
            {
                // Handle error response
                print(data["error task not added"] ?? "NO")

            }
            
        }
        
    }
    
    
    func toggleAssignment(taskID: String) {
        
        print("TASK ID \(taskID)")
        
        requestHandler.toggleAssignment(taskID: taskID, userID: self.id) {
            
            data in
            
            // Check that no error was detected
            if data["error"] == nil
            {
                // Check if all the data is there and is the correct Type
                print("success, assignemnt toggled")
            }
            else
            {
                // Handle error response
                print("Error, assignment not toggled")
                
            }
            
            
        }
        
    }
    
    
    
    
}

extension AuthViewModel {
    func updateTasks(newTasks: [Assignment]) {
        self.taskVM.userTasks = newTasks
        self.objectWillChange.send()  // Manually notify observers of the change
    }
}
