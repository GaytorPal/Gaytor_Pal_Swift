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
        VStack(spacing: 4) {
            Image(systemName: icon)
                .font(.system(size: 30))
                .foregroundColor(iconColor)
                .frame(width: 50, height: 50)
                .background(Color(.systemGray6))
                .cornerRadius(8)

            Text(categoryName)
                .font(.caption)
                .fontWeight(.semibold)
                .foregroundColor(.primary)
                .lineLimit(1)
                .truncationMode(.tail)
                .frame(width: 70)
        }
        .padding(.vertical, 8)
        .frame(width: 80, height: 80)
    }
}

// Preview for the CategoryItemView
struct CategoryItemView_Previews: PreviewProvider {
    static var previews: some View {
        CategoryItemView(categoryName: "Technology", icon: "desktopcomputer", iconColor: .gray)
    }
}
