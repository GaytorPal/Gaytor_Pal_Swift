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
    @State var selectedClub: Club = Club(id: "123", name: "SHPE", fullName: "Society of Hispanic Professional Engineers", description: "", categories: Set(), imageName: "SHPE")
    @StateObject var myclubVM : MyClubsViewModel


    var body: some View {
        VStack(alignment: .leading) {
            Text(sectionTitle)
                .font(.headline).monospaced()
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
                                .font(.caption).monospaced()
                        }
                        .padding(.leading)
                    }
                }
            }
            .sheet(isPresented: $isShowingDetailView) {
                
                    ClubDetailView(club: selectedClub, isShowingDetailView: $isShowingDetailView, myclubVM: myclubVM)
                
            }
        }
        .padding(.top)
    }
}

struct SectionView_Previews: PreviewProvider {
    static var previews: some View {
        // Using just the first two clubs for simplicity in the preview
        SectionView(sectionTitle: "Preview Clubs", clubs: ClubViewModel().clubs, myclubVM: MyClubsViewModel())
    }
}
