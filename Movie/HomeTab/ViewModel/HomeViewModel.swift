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
    @Published var selectedMovies: Movie? = nil
    @Published var selectedMovieForGenre: [Movie] = []
    @Published var genres: [Genre] = []
    @Published var selectedGenre: Genre = .placeHolder
    @Published var errorMessage: String = ""
    
    private let movieService = MovieService()
    
    func fetchTopRatedMovies() async {
        do {
            let movieResponse: MovieResponse = try await movieService.fetchData(from: .init(endpoint: .topRated))
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
            if let genre = genres.first {
                selectedGenre = genre
                await fetchSelectedMovieForGenre()
            }
        } catch {
            errorMessage = "Error: \(error)"
        }
    }
    
    func fetchSelectedMovieForGenre() async {
        do {
            let api = ApiConstructor(endpoint: .discoverMovies, params: ["with_genres": "\(selectedGenre.id)"])
            let reponse: MovieResponse = try await movieService.fetchData(from: api)
            selectedMovieForGenre = reponse.results
        } catch {
            errorMessage = "Error: \(error)"
        }
    }
}
