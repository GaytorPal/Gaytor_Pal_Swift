//
//  SubscriptionsView.swift
//  GaytorPal
//
//  Created by Leonardo Cobaleda on 4/22/24.
//

import SwiftUI

struct SubscriptionsView: View {
    @StateObject var viewModel: MyClubsViewModel

    var body: some View {
        if viewModel.myClubs.isEmpty {
            Text("Go to Explore page to add Clubs").padding()
        } else {
            List(viewModel.myClubs, id: \.id) { club in
                HStack {
                    Image(decorative: club.imageName)
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50)
                    VStack(alignment: .leading) {
                        Text(club.fullName)
                            .font(.headline).monospaced()
                        Text(club.description)
                            .font(.subheadline).monospaced()
                            .foregroundColor(.secondary)
                    }
                }
                .padding(.vertical, 4)
            }
        }
    }
}
