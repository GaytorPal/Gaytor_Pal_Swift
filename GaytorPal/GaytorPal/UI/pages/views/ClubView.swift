import SwiftUI

struct ClubView: View {
    @State private var searchText = ""
    
    let categories: [String: (String, Color)] = [
        "Leadership": ("person.3.fill", .blue),
        "Volunteer": ("hands.clap.fill", .green),
        "Arts": ("paintpalette.fill", .purple),
        "Technology": ("desktopcomputer", .gray),
        "Enviroment": ("leaf.fill", .green),
        "Engr.": ("wrench.fill", .gray),
        "Medicine": ("cross.case.fill", .red),
        "Finance": ("dollarsign.circle.fill", .green),
        "Sciences": ("testtube.2", .blue),
        "Politics": ("building.columns.fill", .yellow),
        "Sports": ("sportscourt.fill", .orange),
        "Language": ("globe", .blue),
        "Culinary": ("fork.knife", .red),
        "Gaming": ("gamecontroller.fill", .purple),
        "Wellness": ("figure.walk.circle.fill", .green),
        "Diversity": ("figure.stand.line.dotted.figure.stand", .orange),
        "Religion": ("staroflife.fill", .yellow),
        "Hobby": ("sparkles", .pink),
        "Music": ("music.note", .black)
    ]

    var body: some View {
            NavigationView {
                ScrollView {
                    VStack(alignment: .leading) {
                        SearchBarView(searchText: $searchText)
                        
                        CategoriesView(categories: categories)
                        
                        SectionView(sectionTitle: "Orginizations", clubs: clubs)
                        SectionView(sectionTitle: "Clubs", clubs: clubs)
                        SectionView(sectionTitle: "New Orgs", clubs: clubs)


                    }
                }
                .navigationTitle("Clubs")
            }
        }
    }


// Preview
struct ClubView_Previews: PreviewProvider {
    static var previews: some View {
        ClubView()
    }
}
