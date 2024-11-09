//
//  DetailView.swift
//  Movie
//
//  Created by shopnil hasan on 9/11/24.
//

import SwiftUI

enum DetailViewSection {
    case about, reviews, cast
    
    var rawValue: String {
        switch self {
        case .about: return "About Movie"
        case .reviews: return "Reviews"
        case .cast: return "Cast"
        }
    }
}

struct DetailView: View {
    
    @StateObject private var vm: DetailViewModel
    @Environment(\.presentationMode) var presentationMode
    @Namespace var namespace
    
    init(movie: Movie) {
        _vm = StateObject(wrappedValue: DetailViewModel(movie: movie))
    }
    
    var body: some View {
        VStack(alignment: .leading) {
            header
            
            VStack {
                HStack {
                    Image.CalendarIcon
                    Text(vm.movie.releaseDate)
                    Text(" | ")
                    Image.ClockIcon
                    Text("148 Minutes")
                    Text(" | ")
                    Image.GenreIcon
                    Text("Action")
                }
                .foregroundStyle(.appGrayColor2)
                
                HStack(spacing: 30) {
                    ForEach(vm.sections, id: \.self) { section in
                        DetailSectionCard(section: section, nameSpace: namespace, selectedSection: $vm.selectedSection)
                            .onTapGesture {
                                withAnimation(.easeInOut) {
                                    vm.selectedSection = section
                                }
                            }
                    }
                    Spacer()
                }
                .padding(.top, 14)
                Spacer()
            }
            .padding()
            .padding(.top, contentPadding)
        }
        .preferredColorScheme(.dark)
        .background(Color.AppBackgroundColor)
    }
}

// MARK: Computed Properties
extension DetailView {
    
    var posterImgeHeight: CGFloat {
        screenHeight * 0.35
    }
    
    var backDropImageSize: CGFloat {
        screenHeight * 0.22
    }
    
    var backdropImageOffset: CGFloat {
        screenHeight * 0.16
    }
    
    var titlePadding: CGFloat {
        screenHeight * 0.08
    }
    
    var contentPadding: CGFloat {
        screenHeight * 0.12
    }
}

// MARK: Header View
private extension DetailView {
    var header: some View {
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
                CustomImageView(width: backDropImageSize, height: backDropImageSize, movie: vm.movie, imageType: .backdrop)
                Text(vm.movie.title)
                    .minimumScaleFactor(0.5)
                    .padding(.top, titlePadding)
            }
            .padding()
            .offset(y: backdropImageOffset)
        }
    }
}

#Preview {
    DetailView(movie: .placeHolder)
}
