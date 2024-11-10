//
//  ReviewCardView.swift
//  Movie
//
//  Created by shopnil hasan on 10/11/24.
//

import SwiftUI

struct ReviewCardView: View {
    let review: Review
    var body: some View {
        VStack(alignment: .leading) {
            HStack {
                AsyncImage(url: URL(string: review.authorImage)) { image in
                    image
                        .resizable()
                } placeholder: {
                    ZStack {
                        Color.appGrayColor1
                        
                        if let firstChart = review.author.first {
                            Text(String(firstChart))
                        }
                    }
                }
                .scaledToFill()
                .frame(width: 45, height: 45)
                .clipShape(Circle())
                
                Text(review.author)
                    .poppins(.medium, 16)
            }
            
            Text(review.content)
                .poppins(.light)
        }
    }
}

#Preview {
    ReviewCardView(review: .placeHolder)
}
