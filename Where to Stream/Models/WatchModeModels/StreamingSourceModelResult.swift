//
//  StreaminSourceModelResult.swift
//  Where to Stream
//
//  Created by William Faucett on 1/26/24.
//

import Foundation

import Foundation

struct StreamingSource: Codable {
    let sourceId: Int
    let name: String
    let type: String
    let region: String
    let iosURL: String?
    let androidURL: String?
    let webURL: String?
    let format: String
    let price: Double?
    let seasons: Int?
    let episodes: Int

    enum CodingKeys: String, CodingKey {
        case sourceId = "source_id"
        case name
        case type
        case region
        case iosURL = "ios_url"
        case androidURL = "android_url"
        case webURL = "web_url"
        case format
        case price
        case seasons
        case episodes
    }
}

struct StreamingSources: Codable {
    let streamingSources: [StreamingSource]
}

