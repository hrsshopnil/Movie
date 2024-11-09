//
//  DetailView.swift
//  Movie
//
//  Created by shopnil hasan on 9/11/24.
//

import SwiftUI

struct DetailView: View {
    @StateObject private var vm: DetailViewModel
    @Environment(\.presentationMode) var presentationMode

    init(movie: Movie) {
        _vm = StateObject(wrappedValue: DetailViewModel(movie: movie))
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            ZStack(alignment: .leading) {
                ZStack(alignment: .top) {
                    CustomImageView(width: screenWidth, height: posterImgeHeight, movie: vm.movie)
                    
                    HStack {
                        Image.BackIcon
                            .onTapGesture {
                                presentationMode.wrappedValue.dismiss()
                            }
                        Spacer()
                        Text("Detail")
                        Spacer()
                        Image.BookmarkIcon
                    }
                    .padding()
                    .background(Color.AppBackgroundColor)
                }
                
                HStack {
                    CustomImageView(width: backDropImageSize, height: backdropImageOffset, movie: vm.movie, imageType: .backdrop)
                    Text(vm.movie.title)
                        .minimumScaleFactor(0.5)
                }
                .padding()
                .offset(y: backdropImageOffset)
            }
        }
        .preferredColorScheme(.dark)
        .background(Color.AppBackgroundColor)
    }
}


extension DetailView {
    
    var posterImgeHeight: CGFloat {
        screenHeight * 0.35
    }
    
    var backDropImageSize: CGFloat {
        screenHeight * 0.22
    }
    
    var backdropImageOffset: CGFloat {
        screenHeight * 0.24
    }
}
#Preview {
    DetailView(movie: .placeHolder)
}
