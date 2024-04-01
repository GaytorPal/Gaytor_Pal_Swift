//
//  SectionView.swift
//  GaytorPal
//
//  Created by Leonardo Cobaleda on 3/31/24.
//

import SwiftUI

struct SectionView: View {
    var sectionTitle: String
    var clubs: [Club]

    @State private var selectedClub: Club?
    @State private var isShowingDetailView = false

    var body: some View {
        VStack(alignment: .leading) {
            Text(sectionTitle)
                .font(.headline)
                .padding(.leading)
            
            ScrollView(.horizontal, showsIndicators: false) {
                HStack {
                    ForEach(clubs, id: \.name) { club in
                        VStack {
                            Image(club.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 100, height: 100)
                                .cornerRadius(8)
                                .onTapGesture {
                                    self.selectedClub = club
                                    self.isShowingDetailView = true
                                }
                            
                            Text(club.name)
                                .font(.caption)
                        }
                        .padding(.leading)
                    }
                }
            }
            .sheet(isPresented: $isShowingDetailView) {
                if let selectedClub = selectedClub {
                    ClubDetailView(club: selectedClub, isShowingDetailView: $isShowingDetailView)
                }
            }
        }
        .padding(.top)
    }
}
