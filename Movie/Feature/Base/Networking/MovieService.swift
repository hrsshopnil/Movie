//
//  MovieService.swift
//  Movie
//
//  Created by shopnil hasan on 8/11/24.
//
import SwiftUI

enum MovieServiceError: Error {
    case invalidResponse
    
}

actor MovieService {
    func fetchData<T: Decodable>(from api: ApiConstructor) async throws -> T {
        
        let url = try DefaultUrlBuilder.build(api: api)
        let (data, response) = try await URLSession.shared.data(from: url)
        guard let responses = response as? HTTPURLResponse, responses.statusCode == 200 else {
            throw MovieServiceError.invalidResponse
        }
        let decodedData = try JSONDecoder().decode(T.self, from: data)
        

        return decodedData

    }
}
