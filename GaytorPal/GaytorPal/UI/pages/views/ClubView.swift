//
//  ClubView.swift
//  GaytorPal
//
//  Created by David Denis on 3/28/24.
//

import SwiftUI

struct ClubView: View {
    
    @EnvironmentObject var viewModel: AuthViewModel
    
    var body: some View {
        Button {
            viewModel.signOut()
        } label: {
            Text("Sign Out")
                .foregroundStyle(.red)
        }
    }
}

#Preview {
    ClubView()
}
