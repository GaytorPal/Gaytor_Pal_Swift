//
//  LoginView.swift
//  SwiftUIAuthTutorial
//
//  Created by David Denis on 1/5/24.
//

// This view uses the viewModel in the main screen (reads it from the environment it is in) uses the same instance

import SwiftUI

struct SignInView: View {
    
    @State private var email = ""
    @State private var password = ""
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        NavigationStack {
            VStack {
                // image
                Image("welcome")
                    .resizable()
                    .scaledToFill()
                    .frame(width: 300, height: 200)
                    .padding(.vertical, 32)
                
                // form fields
                VStack(spacing: 24) {
                    InputView(text: $email, title: "Email Address", placeholder: "name@example.com")
                        .autocapitalization(.none)
                    
                    InputView(text: $password, title: "Password", placeholder: "Enter your password", isSecureField: true)
                }
                .padding(.horizontal)
                .padding(.top, 12)
                
                
                // sign in button
                // uses async awaits (use task{try await} -> uses viewModel instance to log user in to the database
                Button {
                    Task {
                        try await viewModel.signIn(withEmail: email, password: password)
                    }
                } label: {
                    HStack {
                        Text("SIGN IN")
                            .fontWeight(.bold)
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
                    RegisterView()
                        .navigationBarBackButtonHidden(true)
                } label: {
                    HStack(spacing: 4) {
                        Text("Don't have an account?")
                        Text("Sign Up")
                            .fontWeight(.bold)
                    }
                    .font(.system(size: 14))
                }
            }
        }
        .alert(isPresented: $viewModel.showError) {
            Alert(title: Text("Oops!"), message: Text(viewModel.errorMessage))
        }
    }
}

// MARK: - AuthenticationFormProtocol

extension SignInView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty && email.contains("@ufl.edu") && !password.isEmpty && password.count > 5
    }
    
    
}

#Preview {
    SignInView()
        .environmentObject(AuthViewModel())
}
