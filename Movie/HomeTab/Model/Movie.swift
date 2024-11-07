//
//  Welcome.swift
//  Movie
//
//  Created by shopnil hasan on 7/11/24.
//


import Foundation

// MARK: - Welcome
struct MovieResponse: Codable {
    let page: Int
    let results: [Movie]
    let totalPages, totalResults: Int

    enum CodingKeys: String, CodingKey {
        case page, results
        case totalPages = "total_pages"
        case totalResults = "total_results"
    }
}

// MARK: - Result
struct Movie: Codable {
    let adult: Bool
    let backdropPath: String
    let genreIDS: [Int]
    let id: Int
    let originalLanguage: String
    let originalTitle, overview: String
    let popularity: Double
    let posterPath, releaseDate, title: String
    let video: Bool
    let voteAverage: Double
    let voteCount, rating: Int

    enum CodingKeys: String, CodingKey {
        case adult
        case backdropPath = "backdrop_path"
        case genreIDS = "genre_ids"
        case id
        case originalLanguage = "original_language"
        case originalTitle = "original_title"
        case overview, popularity
        case posterPath = "poster_path"
        case releaseDate = "release_date"
        case title, video
        case voteAverage = "vote_average"
        case voteCount = "vote_count"
        case rating
    }
    
    static let placeHolder = Movie(adult: false,
                                   backdropPath: "/YL3GPOiDcNraIJOVDCZsoOBoDy.jpg",
                                   genreIDS: [878,
                                              28,
                                              12,
                                              53],
                                   id: 120,
                                   originalLanguage: "en",
                                   originalTitle: "The Lord of the Rings",
                                   overview: "Young hobbit Frodo Baggins, after inheriting a mysterious ring from his uncle Bilbo, must leave his home in order to keep it from falling into the hands of its evil creator. Along the way, a fellowship is formed to protect the ringbearer and make sure that the ring arrives at its final destination: Mt. Doom, the only place where it can be destroyed.",
                                   popularity: 84.737,
                                   posterPath: "/6oom5QYQ2yQTMJIbnvbkBL9cHo6.jpg",
                                   releaseDate: "2001-12-18",
                                   title: "The Lord of the Rings",
                                   video: false,
                                   voteAverage: 2.3,
                                   voteCount: 300,
                                   rating: 3)

}

extension Movie {
    var imageUrl: String {
        Constants.imageBaseUrl + posterPath
    }
}
