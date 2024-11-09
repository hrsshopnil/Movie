//
//  GenreCard.swift
//  Movie
//
//  Created by shopnil hasan on 9/11/24.
//

import SwiftUI

struct GenreCard: View {
    
    let genre: Genre
    let nameSpace: Namespace.ID
    @Binding var selectedGenre: Genre
    
    var body: some View {
        Text(genre.name)
            .poppins(genre.id == selectedGenre.id ? .bold : .medium, 18)
            .opacity(genre.id == selectedGenre.id ? 1 : 0.8)
            .background {
                ZStack {
                    if selectedGenre.id == genre.id {
                        RoundedRectangle(cornerRadius: 10)
                            .fill(.appGrayColor1)
                            .frame(height: 3)
                            .offset(y: 20)
                            .matchedGeometryEffect(id: "GenreCard", in: nameSpace)
                    }
                }
            }
            .padding()
    }
}

#Preview {
    GenreCard(genre: .placeHolder, nameSpace: Namespace().wrappedValue, selectedGenre: .constant(.placeHolder))
}
