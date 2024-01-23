//
//  SeriesResult.swift
//  Where to Stream
//
//  Created by William Faucett on 1/27/24.
//

import Foundation

struct TVSeriesResult: Decodable {
    let result: [SATVSeriesDetails]
}

struct SATVSeriesDetails: Decodable {
    let firstAirYear: Int
    let originalTitle: String
    let creators: [String]
    let imdbId: String
    let tmdbId: Int
    let type: String
    let title: String
    let lastAirYear: Int
    //let seasons: [Season]
    let genres: [Genre]
    let seasonCount: Int
    let episodeCount: Int
    let status: Status
    let streamingInfo: StreamingInfo?
}

struct Season: Decodable {
    let streamingInfo: StreamingInfo?
    let title: String
    let lastAirYear: Int
    let type: String
    let firstAirYear: Int
    let episodes: [Episode]
}

struct Episode: Decodable {
    let streamingInfo: StreamingInfo?
    let title: String
    let type: String
    let year: Int
}

struct Genre: Decodable {
    let id: Int
    let name: String
}

struct Status: Decodable {
    let statusText: String
    let statusCode: Int
}

struct StreamingInfo: Decodable {
    let us: [StreamingOption]?
    // Add other regions as needed
}

struct StreamingOption: Decodable {
    let audios: [Audios]?
    let subtitles: [Subtitles]?
    let streamingType: String
    let availableSince: Int?
    let service: String
    let link: String?
    
    var capitalizedServiceName: String {
        return service.capitalized
    }
    
    var capitalizedStreamingType: String {
        return streamingType.capitalized
    }
    
    struct Audios: Decodable {
        let audio: [String]?
    }
    
    struct Subtitles: Decodable {
        let subtitle: [String]?
    }
}
