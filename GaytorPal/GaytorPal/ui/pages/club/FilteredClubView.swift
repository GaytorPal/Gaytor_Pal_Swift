import SwiftUI

struct FilteredClubView: View {
    var clubs: [Club]  // Your clubs array
    @State var isShowingDetailView = false
    @State var selectedClub: Club? = nil
    @StateObject var myclubVM : MyClubsViewModel


    var body: some View {
        ScrollView {
            Spacer()
            if clubs.isEmpty {
                VStack {
                    Spacer()
                    Image(systemName: "magnifyingglass.circle")
                        .font(.system(size: 60))
                        .padding(.bottom, 8)
                    Text("No clubs available in this category.")
                        .font(.title3).monospaced()
                        .multilineTextAlignment(.center)
                }
                .foregroundColor(.secondary)
                .padding()
                .frame(maxWidth: 400, maxHeight: 400, alignment: .center)
            } else {
                VStack(alignment: .leading) {
                    ForEach(clubs, id: \.name) { club in
                        HStack {
                            Image(club.imageName)
                                .resizable()
                                .scaledToFit()
                                .frame(width: 60, height: 60)
                                .padding(.horizontal)

                            VStack(alignment: .leading, spacing: 4) {
                                Text(club.fullName)
                                    .fontWeight(.bold)
                                    .lineLimit(1)
                                Text(club.description)
                                    .font(.caption)
                                    .foregroundColor(.secondary)
                                    .lineLimit(2)
                            }
                            Spacer()
                        }
                        .padding()
                        .background(Color(.systemGray6))
                        .cornerRadius(10)
                        .padding(.horizontal)
                        .onTapGesture {
                            self.selectedClub = club
                            self.isShowingDetailView = true
                        }
                    }
                }
            }
        }
        .sheet(isPresented: $isShowingDetailView) {
            if let selectedClub = selectedClub {
                ClubDetailView(club: selectedClub, isShowingDetailView: $isShowingDetailView, myclubVM: myclubVM)
            }
        }
    }
}

// Preview for FilteredClubView
struct FilteredClubView_Previews: PreviewProvider {
    static var previews: some View {
        FilteredClubView(clubs: [], myclubVM : MyClubsViewModel())
    }
}
