import SwiftUI

struct AccountView: View {
    @State private var displayName = ""
    @State private var universityEmail = ""
    @State private var notificationsEnabled = false
    @State private var darkModeEnabled = false
    @StateObject var viewModel: MyClubsViewModel
    @StateObject var vm: AuthViewModel

    var body: some View {
        NavigationView {
            Form {
                ProfileSection
                NotificationsSection
                ClubsOrganizationsSection
                SignOutSection
            }
            .navigationTitle("Account Settings")
        }
        .preferredColorScheme(darkModeEnabled ? .dark : .light)
    }
}

// MARK: - Subviews
extension AccountView {
    private var ProfileSection: some View {
        Section(header: Text("Profile").font(.headline)) {
            Text(vm.username)
                .padding(.vertical, 8)
            Text(vm.email)
                .keyboardType(.emailAddress)
                .autocapitalization(.none)
                .disableAutocorrection(true)
                .padding(.vertical, 8)
        }
    }
    
    private var NotificationsSection: some View {
        Section(header: Text("Notifications").font(.headline)) {
            Toggle("Enable Notifications", isOn: $notificationsEnabled)
                .padding(.vertical, 8)
            Toggle("Dark Mode", isOn: $darkModeEnabled)
                .padding(.vertical, 8)
        }
    }
    
    private var ClubsOrganizationsSection: some View {
        Section(header: Text("Clubs and Organizations").font(.headline)) {
            NavigationLink(destination: SubscriptionsView(viewModel: viewModel)) {
                Text("Manage Subscriptions")
            }
        }
    }




    
    private var SignOutSection: some View {
        Section {
            Button("Sign Out") {
                // Add sign out logic
            }
            .foregroundColor(.white)
            .frame(maxWidth: .infinity)
            .padding()
            .background(Color.red)
            .cornerRadius(8)
        }
        .listRowInsets(EdgeInsets())
    }
}

// MARK: - Preview
struct AccountView_Previews: PreviewProvider {
    static var previews: some View {
        AccountView(viewModel: MyClubsViewModel(), 
                    vm: AuthViewModel(user: User(id: "123", fullName: "David Denis", email: "denis@ufl.edu", username: "sexo3"), taskVM: TaskViewModel()))
    }
}
