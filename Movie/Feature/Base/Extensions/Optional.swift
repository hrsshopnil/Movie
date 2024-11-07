//
//  Optional.swift
//  Movie
//
//  Created by Ahmed Ali on 19/04/2023.
//

import Foundation

extension Optional where Wrapped == String {
    var stringValue: String {
        guard let self = self else { return "" }
        return self
    }
}

/*
    var name: String?
    print(name.stringValue)
 
 */
