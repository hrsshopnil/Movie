//
//  String.swift
//  Movie
//
//  Created by Ahmed Ali on 19/04/2023.
//

import Foundation

extension String {
    var capitalizeFirstLetter: String {
        if self.count == 0 { return self }
        return prefix(1).uppercased() + dropFirst()
    }
}
