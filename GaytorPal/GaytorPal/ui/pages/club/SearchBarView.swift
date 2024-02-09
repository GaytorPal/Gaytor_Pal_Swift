//
//  SearchBarView.swift
//  GaytorPal
//
//  Created by Leonardo Cobaleda on 3/29/24.
//

import SwiftUI

struct SearchBarView: View {
    @Binding var searchText: String
    

    var body: some View {
        TextField("Search for clubs...", text: $searchText)
            .padding(7)
            .background(Color(.systemGray6))
            .cornerRadius(8)
            .padding(.horizontal, 10)
            .monospaced()
    }
}

struct SearchBarView_Previews: PreviewProvider {
    static var previews: some View {
        // Provide a default value for the searchText binding
        SearchBarView(searchText: .constant("Search"))
    }
}

