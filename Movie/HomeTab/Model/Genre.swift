//
//  Genre.swift
//  Movie
//
//  Created by shopnil hasan on 8/11/24.
//

import Foundation

struct GenreResponse: Codable {
    let genres: [Genre]
}

struct Genre: Codable, Identifiable {
    let id: Int
    let name: String
    
    static let placeHolder: Genre = .init(id: 1, name: "Thriller")
}
