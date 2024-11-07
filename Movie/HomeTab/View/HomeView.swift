//
//  ContentView.swift
//  Movie
//
//  Created by shopnil hasan on 7/11/24.
//

import SwiftUI

struct HomeView: View {
    @State private var searchText: String = ""
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(alignment: .leading, spacing: 20) {
                Text("What do you want to watch?")
                    .poppins(.bold, 20)
                SearchBar(searchText: $searchText)
                
                ScrollView(.vertical, showsIndicators: false) {
                    HStack {
                        ForEach(1..<9) { _ in
                            MovieCard(movie: .placeHolder)
                        }
                    }
                }
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(1..<15, id: \.self){ _ in
                        MovieCard(movie: .placeHolder, type: .grid)
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
        .padding()
        .background(.appBackground)
    }
}

#Preview {
    HomeView()
}
