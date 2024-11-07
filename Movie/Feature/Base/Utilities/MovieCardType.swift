//
//  MovieCardType.swift
//  Movie
//
//  Created by shopnil hasan on 7/11/24.
//

import SwiftUI

enum MovieCardType {
    case poster, grid
    
    
    var widthPercentage: CGFloat {
        switch self {
        case .poster: return 0.45
        case .grid: return 0.28
        }
    }
    
    var heightPercentage: CGFloat {
        switch self {
        case .poster: return 0.60
        case .grid: return 0.28
        }
    }
}
