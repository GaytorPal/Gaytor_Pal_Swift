//
//  CategoriesView.swift
//  GaytorPal
//
//  Created by Leonardo Cobaleda on 3/29/24.
//

import SwiftUI

struct CategoriesView: View {
    let categories: [String: (String, Color)]

    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                ForEach(categories.keys.sorted(), id: \.self) { key in
                    let (icon, color) = categories[key]!
                    CategoryItemView(categoryName: key, icon: icon, iconColor: color)
                }
            }
        }
    }
}

struct CategoriesView_Previews: PreviewProvider {
    static var previews: some View {
        // Provide a small set of example categories for the preview
        CategoriesView(categories: [
            "Leadership": ("person.3.fill", .blue),
            "Technology": ("desktopcomputer", .gray),
            "Wellness": ("figure.walk.circle.fill", .green)
        ])
    }
}

