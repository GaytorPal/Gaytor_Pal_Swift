//
//  LoginView.swift
//  SwiftUIAuthTutorial
//
//  Created by David Denis on 1/5/24.
//

// This view uses the viewModel in the main screen (reads it from the environment it is in) uses the same instance

import SwiftUI

struct SignInView: View {
    
    @State private var username = ""
    @State private var password = ""
    
    @ObservedObject var vm : AuthViewModel
    
    
    
    var body: some View {
        NavigationStack {
            VStack {
                // image
                Text("Welcome")
                    .font(.system(size: 50)).italic().bold().monospaced()
                    .frame(width: 300, height: 150)
                    .padding(.vertical, 32)
                    
                    .clipShape(RoundedRectangle(cornerRadius: 25.0))
                    
                    
                
                // form fields
                VStack(spacing: 24) {
                    InputView(text: $username, title: "Username", placeholder: "John Doe")
                        .autocapitalization(.none)
                    
                    InputView(text: $password, title: "Password", placeholder: "Enter your password", isSecureField: true)
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                
                // sign in button
                // uses async awaits (use task{try await} -> uses viewModel instance to log user in to the database
                Button {
                    Task {
                        
                        vm.login(username: username,  password: password)
                        
                    }
                } label: {
                    HStack {
                        Text("SIGN IN")
                            .fontWeight(.bold).monospaced()
                        Image(systemName: "arrow.right")
                    }
                    .foregroundStyle(.white)
                    .frame(width: UIScreen.main.bounds.width - 32, height: 40)
                    
                }
                .background(Color(.blue))
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0 : 0.5)
                .clipShape(.rect(cornerRadius: 10))
                .padding(.top, 24)
                
                Spacer()
                
                //sign up button
                
                NavigationLink {
                    RegisterView(vm: vm)
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 4) {
                        Text("Don't have an account?")
                            
                        Text("Sign Up")
                            .fontWeight(.bold)
                            
                    }
                    .font(.system(size: 14)).monospaced()
                }
            }
            .background(LinearGradient(colors: [.red, .white, .white, .black], startPoint: .topLeading, endPoint: .bottomTrailing))
        }
        
    }
}

// MARK: - AuthenticationFormProtocol

extension SignInView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !username.isEmpty && !password.isEmpty && password.count > 5
    }
    
    
}

#Preview {
    SignInView(vm: AuthViewModel(user: User(id: "123", fullName: "David Denis", email: "denis@ufl.edu", username: "David"), taskVM: TaskViewModel()))
}
