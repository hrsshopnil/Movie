//
//  Poppins.swift
//  Movie
//
//  Created by shopnil hasan on 7/11/24.
//

import Foundation

enum Poppins: String {
    case black, bold, light, medium, regular, semiBold
    
    var fontName: String {
        "Poppins-\(self.rawValue.capitalized)"
    }
}
