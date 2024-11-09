//
//  CustomCardView.swift
//  Movie
//
//  Created by shopnil hasan on 7/11/24.
//

import SwiftUI

struct CustomImageView: View {
    
    let width: CGFloat
    let height: CGFloat
    let movie: Movie
    var imageType: ImageType = .poster
    
    var body: some View {
        AsyncImage(url: URL(string: movie.getImage(type: imageType))) { image in
            image
                .resizable()
                .scaledToFill()
        } placeholder: {
            ZStack {
                Color.AppGrayColor1
                
                Text(movie.title)
                    .poppins(.light)
                    .padding()
            }
        }
        .frame(width: width, height: height)
        .clipShape(RoundedRectangle(cornerRadius: 20))
    }
}

#Preview {
    CustomImageView(width: 250, height: 250, movie: .placeHolder)
}
