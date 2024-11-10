//
//  DetailViewModel.swift
//  Movie
//
//  Created by shopnil hasan on 9/11/24.
//

import Foundation

@MainActor
class DetailViewModel: ObservableObject {
    let movie: Movie
    let sections: [DetailViewSection] = [.about, .reviews, .cast]
    @Published var selectedSection: DetailViewSection = .about
    @Published var reviews: [Review] = []
    
    private let movieService = MovieService()
    init(movie: Movie) {
        self.movie = movie
    }
    
    func fetchReviews() async {
        do {
            let response: ReviewsResponse = try await movieService.fetchData(from: ApiConstructor(endpoint: .movieReviews(movie.id)))
            print(response)
            reviews = response.results
        } catch {
            print("Error fetching reviews: \(error)")
        }
    }
}
