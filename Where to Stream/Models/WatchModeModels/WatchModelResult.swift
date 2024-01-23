//
//  WatchModeResult.swift
//  Where to Stream
//
//  Created by William Faucett on 1/25/24.
//

import Foundation

struct WatchSearchResult: Codable {
    var people_results: [String] // You might want to create a proper model for people_results
    var title_results: [TitleResult]

    enum CodingKeys: String, CodingKey {
        case people_results
        case title_results
    }
}

struct TitleResult: Codable, Identifiable {
    var id: Int
    var imdbId: String
    var name: String
    var resultType: String
    var tmdbId: Int
    var tmdbType: String
    var type: String
    var year: Int

    enum CodingKeys: String, CodingKey {
        case id
        case imdbId = "imdb_id"
        case name
        case resultType = "resultType"
        case tmdbId = "tmdb_id"
        case tmdbType = "tmdb_type"
        case type
        case year
    }
}
