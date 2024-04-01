//
//  CategoryItemView.swift
//  GaytorPal
//
//  Created by Leonardo Cobaleda on 3/29/24.
//

import SwiftUI

struct CategoryItemView: View {
    let categoryName: String
    let icon: String
    let iconColor: Color

    var body: some View {
           VStack(spacing: 4) { // Reduced spacing to make the overall size more compact
               Image(systemName: icon)
                   .font(.system(size: 30)) // Adjusted for a more suitable icon size
                   .foregroundColor(iconColor)
                   .frame(width: 50, height: 50) // Fixed frame to maintain consistent icon size
                   .background(Color(.systemGray6))
                   .cornerRadius(8)
               
               Text(categoryName)
                   .font(.caption) // Smaller font for the text
                   .fontWeight(.semibold)
                   .foregroundColor(.primary)
                   .lineLimit(1) // Limit the text to a single line
                   .truncationMode(.tail) // If the text is too long, it will be truncated at the end
                   .frame(width: 70) // Fixed frame width to ensure text doesn't expand indefinitely
           }
           .padding(.vertical, 8) // Padding to ensure there's some space above and below the content
           .frame(width: 80, height: 80) // Fixed frame to ensure consistent sizing for each category item
       }
   }

struct CategoryItemView_Previews: PreviewProvider {
    static var previews: some View {
        // Provide example values for categoryName, icon, and iconColor
        CategoryItemView(categoryName: "Technology", icon: "desktopcomputer", iconColor: .gray)
    }
}
