//
//  DetailViewModel.swift
//  Movie
//
//  Created by shopnil hasan on 9/11/24.
//

import Foundation

class DetailViewModel: ObservableObject {
    let movie: Movie
    let sections: [DetailViewSection] = [.about, .reviews, .cast]
    @Published var selectedSection: DetailViewSection = .about
    
    init(movie: Movie) {
        self.movie = movie
    }
}
