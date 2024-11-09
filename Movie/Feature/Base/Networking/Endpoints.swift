//
//  Endpoints.swift
//  Movie
//
//  Created by shopnil hasan on 8/11/24.
//

import Foundation

enum Endpoints {
    case trending, topRated, genre, movieReviews(_ movieId: Int), discoverMovies
    
    private var path: String {
        switch self {
            
        case .trending:
            "trending/movie/week"
        case .topRated:
            "movie/top_rated?"
        case .genre:
            "genre/movie/list"
        case .movieReviews(let movieId):
            "movie/\(movieId)/reviews"
        case .discoverMovies:
            "discover/movie"
        }
    }
    
    var fullPath: String {
        Constants.baseUrl + path
    }
}
