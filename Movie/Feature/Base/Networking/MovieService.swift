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
        print("url: \(url.absoluteString)")
        let (data, response) = try await URLSession.shared.data(from: url)
        
        guard let responses = response as? HTTPURLResponse, responses.statusCode == 200 else {
            throw MovieServiceError.invalidResponse
        }
        print(data.endIndex)
        let decodedData = try JSONDecoder().decode(T.self, from: data)
        print("Decoded Data: \(decodedData)")
        return decodedData
    }
}
