import SwiftUI


struct ClubDetailView: View {
    let club: Club
    @Binding var isShowingDetailView: Bool
    @StateObject var myClubsViewModel: MyClubsViewModel

    var body: some View {
        VStack {
            HStack {
                Spacer()
                Button {
                    isShowingDetailView = false
                } label: {
                    Image(systemName: "xmark")
                        .foregroundColor(.black)
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
                myClubsViewModel.addClub(club)
                isShowingDetailView = false
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

struct ClubDetailView_Previews: PreviewProvider {
    static var previews: some View {
        // Dummy Club data for preview purposes
        ClubDetailView(club: Club(name: "Sample Club", imageName: "sampleImage", fullName: "Full Name of Sample Club", description: "Description here", categories: Set<String>()), isShowingDetailView: .constant(true), myClubsViewModel: MyClubsViewModel())
    }
}
