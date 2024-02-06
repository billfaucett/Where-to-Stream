//
//  OMdbModelResult.swift
//  Where to Stream
//
//  Created by William Faucett on 1/28/24.
//

import Foundation

struct OMdbModelResult: Codable {
    let Title: String
    let Year: String
    let Rated: String
    let Released: String
    let Runtime: String
    let Genre: String
    let Director: String
    let Writer: String
    let Actors: String
    let Plot: String
    let Language: String
    let Country: String
    let Awards: String
    let Poster: String
    let Ratings: [Rating]
    let Metascore: String
    let imdbRating: String
    let imdbVotes: String
    let imdbID: String
    //let type: String
    let totalSeasons: String?
    let Response: String

    struct Rating: Codable {
        let Source: String
        let Value: String
    }
}

