//
//  ViewModel.swift
//  Movie
//
//  Created by shopnil hasan on 8/11/24.
//
import SwiftUI

@MainActor
final class HomeViewModel: ObservableObject {
    
    @Published var topRatedMovies: [Movie] = []
    @Published var trendingMovies: [Movie] = []
    @Published var genres: [Genre] = []
    @Published var errorMessage: String = ""
    @Published var selectedGenre: Genre = .placeHolder
    
    private let movieService = MovieService()
    
    func fetchTopRatedMovies() async {
        do {
            let movieResponse: MovieResponse = try await movieService.fetchData(from: .init(endpoint: .topRated))
            print(movieResponse.results[0])
            topRatedMovies = movieResponse.results
        } catch {
            errorMessage = "Error: \(error)"
        }
    }
    
    func fetchTrendingMovies() async {
        do {
            let movieResponse: MovieResponse = try await movieService.fetchData(from: .init(endpoint: .trending))
            trendingMovies = movieResponse.results
        } catch {
            errorMessage = "Error: \(error)"
        }
    }
    
    func fetchGenres() async {
        do {
            let GenreResponse: GenreResponse = try await movieService.fetchData(from: .init(endpoint: .genre))
            genres = GenreResponse.genres
        } catch {
            errorMessage = "Error: \(error)"
        }
    }
}
