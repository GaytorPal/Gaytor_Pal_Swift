//
//  RegistrationView.swift
//  SwiftUIAuthTutorial
//
//  Created by David Denis on 1/5/24.
//

// This view uses the viewModel in the main screen (reads it from the environment it is in) uses the same instance

import SwiftUI

struct RegisterView: View {
    
    @State private var email = ""
    @State private var password = ""
    @State private var fullname = ""
    @State private var confirmPassword = ""
    @Environment(\.dismiss) var dismiss
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        VStack {
            Image("welcome")
                .resizable()
                .scaledToFill()
                .frame(width: 300, height: 200)
                .padding(.vertical, 32)
            
            
            VStack(spacing: 24) {
                InputView(text: $email, title: "Email Address", placeholder: "name@example.com")
                    .autocapitalization(.none)
                
                InputView(text: $fullname, title: "Full Name", placeholder: "Enter your name")
                
                InputView(text: $password, title: "Password", placeholder: "Enter your password", isSecureField: true)
                
                ZStack(alignment: .trailing) {
                    InputView(text: $confirmPassword, title: "Confirm Password", placeholder: "Confirm your password", isSecureField: true)
                    
                    if !password.isEmpty && !confirmPassword.isEmpty {
                        if password == confirmPassword {
                            Image(systemName: "checkmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundStyle(Color(.systemGreen))
                            
                        } else {
                            Image(systemName: "xmark.circle.fill")
                                .imageScale(.large)
                                .fontWeight(.bold)
                                .foregroundStyle(Color(.systemRed))
                        }
                    }
                }
            }
            .padding(.horizontal)
            .padding(.top, 12)
            
            // uses async awaits (use task{try await} -> uses viewModel instance to log user in to the database
            Button {
                Task {
                    try await viewModel.createUser(withEmail: email, password: password, fullname: fullname)
                }
            } label: {
                HStack {
                    Text("SIGN UP")
                        .fontWeight(.bold)
                    Image(systemName: "arrow.right")
                }
                .foregroundStyle(.white)
                .disabled(!formIsValid)
                .opacity(formIsValid ? 1.0 : 0.5)
                .frame(width: UIScreen.main.bounds.width - 32, height: 40)
                
            }
            .background(Color(.blue))
            .clipShape(.rect(cornerRadius: 10))
            .padding(.top, 24)
            
            Spacer()
            
            Button {
                dismiss()
            } label: {
                HStack(spacing: 4) {
                    Text("Already an account?")
                    Text("Sign in")
                        .fontWeight(.bold)
                }
                .font(.system(size: 14))
            }
            
        }
        .alert(isPresented: $viewModel.showError) {
            Alert(title: Text("Error"), message: Text(viewModel.errorMessage))
        }
    }
}

// MARK: - AuthenticationFormProtocol

extension RegisterView: AuthenticationFormProtocol {
    var formIsValid: Bool {
        return !email.isEmpty && email.contains("@ufl.edu") && !password.isEmpty && password.count > 5 && confirmPassword == password && !fullname.isEmpty
    }
    
    
}

#Preview {
    RegisterView()
        .environmentObject(AuthViewModel())
}
