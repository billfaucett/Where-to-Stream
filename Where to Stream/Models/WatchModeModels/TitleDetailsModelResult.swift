//
//  TitleDetailsModelResult.swift
//  Where to Stream
//
//  Created by William Faucett on 1/25/24.
//

import Foundation

struct TVSeriesDetails: Codable {
    let userRating: Double
    let releaseDate: String
    let year: Int
    let backdrop: String
    let networks: [Int]
    let usRating: String
    let criticScore: Int
    let similarTitles: [Int]
    let englishTitle: String
    let endYear: Int
    let imdbId: String
    let title: String
    let id: Int
    let tmdbId: Int
    let originalTitle: String
    let networkNames: [String]
    let tmdbType: String
    let genreNames: [String]
    let runtimeMinutes: Int?
    let trailer: String
    let relevancePercentile: Double
    let trailerThumbnail: String
    let poster: String
    let genres: [Int]
    let type: String
    let originalLanguage: String
    let plotOverview: String
    
    enum CodingKeys: String, CodingKey {
        case userRating = "user_rating"
        case releaseDate = "release_date"
        case year
        case backdrop
        case networks
        case usRating = "us_rating"
        case criticScore = "critic_score"
        case similarTitles = "similar_titles"
        case englishTitle = "english_title"
        case endYear = "end_year"
        case imdbId = "imdb_id"
        case title
        case id
        case tmdbId = "tmdb_id"
        case originalTitle = "original_title"
        case networkNames = "network_names"
        case tmdbType = "tmdb_type"
        case genreNames = "genre_names"
        case runtimeMinutes = "runtime_minutes"
        case trailer
        case relevancePercentile = "relevance_percentile"
        case trailerThumbnail = "trailer_thumbnail"
        case poster
        case genres
        case type
        case originalLanguage = "original_language"
        case plotOverview = "plot_overview"
    }
}
