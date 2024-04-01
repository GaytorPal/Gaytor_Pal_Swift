//
//  ClubDetailView.swift
//  GaytorPal
//
//  Created by Leonardo Cobaleda on 3/31/24.
//

import SwiftUI
struct ClubDetailView: View {
    let club: Club
    @Binding var isShowingDetailView: Bool

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    isShowingDetailView = false
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.black )
                        .imageScale(.large)
                        .frame(width: 44, height: 44)
                }
            }
            .padding()

            Spacer()
            
            Image(club.imageName)
                           .resizable()
                           .scaledToFit()
                           .frame(width: 150, height: 150)
                           .padding(.bottom)


            Text(club.fullName)
                .font(.title)
                .padding()

            Text(club.description)
                .font(.body)
                .padding()

            Spacer()

            Button {
            } label: {
                Text("Add Club to Calendar")
                    .foregroundColor(.white)
                    .padding()
                    .background(RoundedRectangle(cornerRadius: 10).foregroundColor(.blue))
            }
            .padding()
        }
        .padding()
    }
}

