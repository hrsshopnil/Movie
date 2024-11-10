//
//  Review.swift
//  Movie
//
//  Created by shopnil hasan on 10/11/24.
//

import Foundation

struct ReviewsResponse: Codable {
    let results: [Review]
}

struct Review: Codable,Identifiable {
    let author: String
    let authorDetails: AuthorDetails?
    let content: String
    let createdAt: String?
    let id: String
    let updatedAt: String?
    let url: String
    
    static let placeHolder = Review(author: "Shopnil Hasan", authorDetails: AuthorDetails(name: "Shopnil Hasan", username: "hrsshopnil", avatarPath: nil, rating: 4), content: "Absolute Masterpiece", createdAt: "", id: "2", updatedAt: "", url: "")
}

struct AuthorDetails: Codable {
    let name: String
    let username: String
    let avatarPath: String?
    let rating: Int?
    
    enum CodingKeys: String, CodingKey {
        case name, username, rating
        case avatarPath = "avatar_path"
    }
}

extension Review {
    var authorName: String {
        authorDetails?.authorName ?? author
    }
    
    var authorImage: String {
        var image = authorDetails?.avatarPath ?? ""
        if image.starts(with: "/") {
            image = String(image.dropFirst())
        }
        return image
    }
}

extension AuthorDetails {
    var authorName: String {
        name.trimmingCharacters(in: .whitespacesAndNewlines).isEmpty ? username : name
    }
}
