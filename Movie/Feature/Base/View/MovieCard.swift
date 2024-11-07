//
//  MovieCard.swift
//  Movie
//
//  Created by shopnil hasan on 7/11/24.
//

import SwiftUI

struct MovieCard: View {
    let movie: Movie
    var type: MovieCardType = .poster
    var body: some View {
        CustomCardView(width: width, height: height, movie: movie)
    }
}


extension MovieCard {
    var width: CGFloat {
        screenWidth * type.widthPercentage
    }
    
    var height: CGFloat {
        screenWidth * type.heightPercentage
    }
}
#Preview {
    MovieCard(movie: .placeHolder)
}
