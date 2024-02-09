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

    @State var isShowingDetailView = false
    @State var selectedClub: Club? = nil


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
                                    self.isShowingDetailView.toggle()
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

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        // Using just the first two clubs for simplicity in the preview
        SectionView(sectionTitle: "Preview Clubs", clubs: ClubViewModel().clubs)
            .previewLayout(.sizeThatFits)
    }
}
