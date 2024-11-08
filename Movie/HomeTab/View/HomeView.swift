//
//  ContentView.swift
//  Movie
//
//  Created by shopnil hasan on 7/11/24.
//

import SwiftUI

struct HomeView: View {
    
    @State private var searchText: String = ""
    @Namespace var nameSpace
    @StateObject private var vm = HomeViewModel()
    
    var body: some View {
        ScrollView(showsIndicators: false) {
            LazyVStack(alignment: .leading, spacing: 20) {
                Text("What do you want to watch?")
                    .poppins(.bold, 20)
                SearchBar(searchText: $searchText)
                
                ScrollView(.vertical, showsIndicators: false) {
                    HStack {
                        ForEach(vm.trendingMovies) { movie in
                            MovieCard(movie: movie)
                        }
                    }
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(vm.genres) { genre in
                            GenreCard(genre: genre, nameSpace: nameSpace, selectedGenre: $vm.selectedGenre)
                        }
                    }
                }
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(vm.topRatedMovies){ movie in
                        MovieCard(movie: movie, type: .grid)
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
        .padding()
        .background(.appBackground)
        .task {
            await vm.fetchTrendingMovies()
            await vm.fetchTopRatedMovies()
            await vm.fetchGenres()
        }
    }
}

#Preview {
    HomeView()
}
