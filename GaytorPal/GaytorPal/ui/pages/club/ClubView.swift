import SwiftUI

struct ClubView: View {
    @State private var searchText = ""
    @State private var selectedCategory: String?
    
    let categories: [String: (String, Color)] = [
        "Leadership": ("person.3.fill", .blue),
        "Volunteer": ("hands.clap.fill", .green),
        "Arts": ("paintpalette.fill", .purple),
        "Technology": ("desktopcomputer", .gray),
        "Environment": ("leaf.fill", .green),
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

    var filteredClubs: [Club] {
        if searchText.count >= 1 {
            return clubs.filter { club in
                club.name.lowercased().contains(searchText.lowercased()) ||
                club.fullName.lowercased().contains(searchText.lowercased())
            }
        } else {
            return clubs
        }
    }

    var body: some View {
        NavigationView {
            ScrollView {
                VStack(alignment: .leading) {
                    SearchBarView(searchText: $searchText)

                    // Categories View remains unchanged
                    CategoriesView(categories: categories, selectedCategory: $selectedCategory)
                    
                    if let category = selectedCategory, let _ = categories[category] {
                        // Show filtered clubs for selected category
                        FilteredClubView(clubs: clubs.filter { $0.categories.contains(category) })
                            .padding(.top)
                    } else if searchText.count >= 1 {
                        // Use the search bar to filter clubs by name or full name
                        FilteredClubView(clubs: filteredClubs)
                            .padding(.top)
                    } else {
                        // Default view showing all sections as originally implemented
                        SectionView(sectionTitle: "Organizations", clubs: clubs)
                        SectionView(sectionTitle: "Clubs", clubs: clubs)
                        SectionView(sectionTitle: "New Orgs", clubs: clubs)
                    }
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
