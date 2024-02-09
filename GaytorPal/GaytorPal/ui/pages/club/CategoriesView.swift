//
//  CategoriesView.swift
//  GaytorPal
//
//  Created by Leonardo Cobaleda on 3/29/24.
//

import SwiftUI

struct CategoriesView: View {
    let categories: [String: (String, Color)]
    @Binding var selectedCategory: String?  // Use Binding to allow parent view to track changes

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack(spacing: 10) {
                ForEach(categories.keys.sorted(), id: \.self) { key in
                    let (icon, color) = categories[key]!
                    
                    Button(action: {
                        selectedCategory = selectedCategory == key ? nil : key
                    }) {
                        CategoryItemView(categoryName: key, icon: icon, iconColor: color)
                            .scaleEffect(selectedCategory == key ? 1.1 : 1.0)
                            .animation(.easeInOut, value: selectedCategory)
                    }
                    .buttonStyle(PlainButtonStyle())
                }
            }
            .padding(.horizontal)
        }
    }
}

//// Preview for the CategoriesView
//struct CategoriesView_Previews: PreviewProvider {
//    static var previews: some View {
//        CategoriesView(categories: [
//            "Leadership": ("person.3.fill", .blue),
//            "Technology": ("desktopcomputer", .gray),
//            "Wellness": ("figure.walk.circle.fill", .green)
//        ])
//    }
//}
