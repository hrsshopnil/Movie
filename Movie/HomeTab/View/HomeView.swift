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
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(vm.trendingMovies) { movie in
                            MovieCard(movie: movie)
                                .onTapGesture {
                                    vm.selectedMovies = movie
                                }
                        }
                    }
                }
                
                ScrollView(.horizontal, showsIndicators: false) {
                    HStack {
                        ForEach(vm.genres) { genre in
                            GenreCard(genre: genre, nameSpace: nameSpace, selectedGenre: $vm.selectedGenre)
                                .onTapGesture {
                                    withAnimation(.easeInOut) {
                                        vm.selectedGenre = genre
                                        Task {
                                            await vm.fetchSelectedMovieForGenre()
                                        }
                                    }
                                }
                        }
                    }
                }
                
                LazyVGrid(columns: [GridItem(.flexible()), GridItem(.flexible()), GridItem(.flexible())], spacing: 20) {
                    ForEach(vm.selectedMovieForGenre){ movie in
                        MovieCard(movie: movie, type: .grid)
                    }
                }
            }
        }
        .preferredColorScheme(.dark)
        .padding()
        .background(.appBackground)
        .fullScreenCover(item: $vm.selectedMovies) { movie in
            DetailView(movie: movie)
        }
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
