//
//  DetailViewModel.swift
//  Movie
//
//  Created by shopnil hasan on 9/11/24.
//

import Foundation

class DetailViewModel: ObservableObject {
    let movie: Movie
    
    init(movie: Movie) {
        self.movie = movie
    }
}
