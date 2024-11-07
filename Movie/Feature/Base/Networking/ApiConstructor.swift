//
//  ApiConstructor.swift
//  Movie
//
//  Created by shopnil hasan on 8/11/24.
//

import Foundation

typealias Parameters = [String: String]

struct ApiConstructor {
    let endpoint: Endpoints
    var params: Parameters = [:]
}
