//
//  SearchBar.swift
//  Movie
//
//  Created by shopnil hasan on 7/11/24.
//

import SwiftUI

struct SearchBar: View {
    @Binding var searchText: String
    var body: some View {
        TextField("Search", text: $searchText)
            .overlay (
                ZStack {
                    if searchText.isEmpty {
                        Image.SearchIcon
                    } else {
                        Image.CancelIcon
                            .foregroundStyle(.white)
                            .onTapGesture {
                                searchText = ""
                                UIApplication.shared.endEditing()
                            }
                    }
                }
                , alignment: .trailing
            )
            .foregroundStyle(.appGrayColor2)
            .padding(16)
            .background(
                RoundedRectangle(cornerRadius: 20)
                    .fill(Color.appGrayColor1)
            )
            .padding(10)
    }
}

#Preview {
    SearchBar(searchText: .constant("Hello, World!"))
}
