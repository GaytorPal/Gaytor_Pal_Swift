//
//  RequestHandler.swift
//  GaytorPal
//
//  Created by David Denis on 4/17/24.
//

import Foundation
import Apollo

class RequestHandler {
    
    let apolloClient = ApolloClient(url: URL(string: "https://fba5-128-227-1-38.ngrok-free.app")!) // MUST BE NGROK URL or http://127.0.0.1:5000/
    
    func signIn(username:String, password:String, completion: @escaping ([String:Any])->Void)
    {
        apolloClient.perform(mutation: Gschema.LoginMutation(username: username, password: password))
        {
            response in
            guard let data = try? response.get().data
            else
            {
                print("ERROR: Incomplete Request\nError Message:\(response)")
                
                // Package with data (ERROR ❌)
                completion(["error":"Incomplete Request"])
                return
            }
            // Package with data (SUCCESS ✅)
            
            
            let login = data.loginUser
            let responseDict = [
                "email": login.email,
                "username": login.username,
                "id": login.id
                
            ]
            
            completion(responseDict)
        }
    }
    
    
    func registerUser(username: String, password: String, email: String, completion: @escaping ([String:Any])->Void)
    {
        
        let registerInput = Gschema.RegisterInput(username: username, password: password, confirmPassword: password, email: email)
        
        let validInput = GraphQLNullable(registerInput)
        
        
        apolloClient.perform(mutation: Gschema.RegisterUserMutation(registerInput: validInput))
        {
            response in
            
            guard let data = try? response.get().data
            else {
                print("ERROR: Incomplete Request\nError Message:\(response)")
                
                // Package with data (ERROR ❌)
                completion(["error":"Incomplete Request"])
                return
            }
            
            let responseDict = [
                "success": true
            ]
            
            completion(responseDict)
        }
        
        
        
    }
    
    
    func addAssignment(usernameX: String, title: String, description: String, dueDate: String, category: String, completion: @escaping ([String:Any])->Void)
    {
        
        print("HELOOOOOOO")
        print(usernameX)
        
        apolloClient.perform(mutation: Gschema.AddAssignmentMutation(username: usernameX, title: title, description: description, dueDate: dueDate, category: category))
        {
            response in
            
            guard let data = try? response.get().data
            else {
                print("ERROR: Incomplete Request\nError Message XD:\(response)")
                
                // Package with data (ERROR ❌)
                completion(["error":"Incomplete Add Assignment Request"])
                return
            }
            
            let responseDict = [
                "success": true
            ]
            
            completion(responseDict)
        }
        
    }
    
    
    func getUserAssignments(userId: String, date: String, completion: @escaping ([String:Any])->Void)
    {
        apolloClient.fetch(query: Gschema.GetAssignmentsByDueQuery(targetUsername: userId, targetDueDate: date))
        {
            response in
            
            
            guard let data = try? response.get().data else {
                print("ERROR: Incomplete Request")
                // If data could not be unwrapped, handle the error
                completion(["error": "Incomplete Request"])
                return
            }
            
            let assignments = data.getAssignmentsByDue.map({ task in
                
                let formatter = DateFormatter()
                formatter.dateFormat = "MM/dd/yyyy HH:mm"
                
                
                if let taskTitle = task?.title,
                   let taskCategory = task?.category,
                   let taskDesc = task?.description,
                   let taskID = task?.id,
                   let dateString = task?.dueDate,
                   let dueDate = formatter.date(from: dateString)
                {
                    print(dateString)
                    print(dueDate)
                    return Assignment(id: taskID, taskTitle: taskTitle, taskDescription: taskDesc, dueDate: dueDate, category: TaskCategory(rawValue: taskCategory) ?? .personalEvent)
                }
                else {
                    return Assignment(taskTitle: "None", taskDescription: "None", dueDate: Date(), category: .clubEvent)
                }
                
            })
            
            
            
            let responseDict = [
                
                "assignments" : assignments
            ]
            
            completion(responseDict)
            
        }
        
    }
    
    
    func toggleAssignment(taskID: String, userID: String, completion: @escaping ([String:Any])->Void)
    {
        
        apolloClient.perform(mutation: Gschema.ToggleAssignmentMutation(targetId: taskID, userId: userID))
        {
            response in
            
            guard let data = try? response.get().data
            else {
                print("ERROR: Incomplete Request\nError Message:\(response)")
                
                // Package with data (ERROR ❌)
                completion(["error":"Incomplete Request"])
                return
            }
            
            let responseDict = [
                "success": true
            ]
            
            completion(responseDict)
        }
        
        
        
    }

    func getAllClubs(completion: @escaping ([Club], Error?) -> Void) {
        apolloClient.fetch(query: Gschema.GetAllClubsQuery(), cachePolicy: .fetchIgnoringCacheData) { result in
            switch result {
            case .success(let graphQLResult):
                if let clubData = graphQLResult.data?.getClubsWithNames {
                    let clubs = clubData.compactMap { data -> Club? in
                        let id = data.id
                        let username = data.username
                        let clubName = data.club_name ?? ""
                        let description = data.description
                        let categories = data.category.compactMap { $0 }
                        
                        return Club(id: id, name: username, fullName: clubName, description: description, categories: Set(categories), imageName: username)
                    }
                    completion(clubs, nil)
                } else if let errors = graphQLResult.errors {
                    let error = NSError(domain: "", code: -1, userInfo: [NSLocalizedDescriptionKey: "GraphQL error: \(errors.map { $0.localizedDescription }.joined(separator: ", "))"])
                    completion([], error)
                }
            case .failure(let error):
                completion([], error)
            }
        }
    }

    
    
    
    
    
}


