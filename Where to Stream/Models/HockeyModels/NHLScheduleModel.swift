//
//  NHLScheduleModel.swift
//  Where to Stream
//
//  Created by William Faucett on 1/30/24.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//

import Foundation

// MARK: - Welcome
struct Schedule: Codable {
    let nextStartDate, previousStartDate: String?
    let gameWeek: [GameWeek]?
    let oddsPartners: [OddsPartner]?
    let preSeasonStartDate, regularSeasonStartDate, regularSeasonEndDate, playoffEndDate: String?
    let numberOfGames: Int?
}

// MARK: - GameWeek
struct GameWeek: Codable {
    let date, dayAbbrev: String
    let numberOfGames: Int
    let games: [Game]
}

// MARK: - Game
struct Game: Codable {
    let id, season, gameType: Int
    let venue: Venue
    let neutralSite: Bool
    let startTimeUTC: String
    let easternUTCOffset, venueUTCOffset, venueTimezone, gameState: String
    let gameScheduleState: String
    let tvBroadcasts: [TvBroadcast]
    let awayTeam, homeTeam: Team
    let periodDescriptor: PeriodDescriptor
    let gameOutcome: GameOutcome?
    let winningGoalie, winningGoalScorer: WinningGoal?
    let threeMinRecap, threeMinRecapFr, gameCenterLink: String?
    let ticketsLink: String?
}

// MARK: - Team
struct Team: Codable {
    let id: Int
    let placeName: PlaceName
    let abbrev: String
    let logo, darkLogo: String
    let awaySplitSquad: Bool?
    let score: Int?
    let radioLink: String?
    let odds: [Odd]?
    let homeSplitSquad: Bool?
    let onIce: [JSONAny]?
}

// MARK: - Odd
struct Odd: Codable {
    let providerID: Int
    let value: String

    enum CodingKeys: String, CodingKey {
        case providerID = "providerId"
        case value
    }
}

// MARK: - PlaceName
struct PlaceName: Codable {
    let placeNameDefault: String

    enum CodingKeys: String, CodingKey {
        case placeNameDefault = "default"
    }
}

// MARK: - GameOutcome
struct GameOutcome: Codable {
    let lastPeriodType: String
}

// MARK: - PeriodDescriptor
struct PeriodDescriptor: Codable {
    let number: Int?
    let periodType: String?
}

// MARK: - TvBroadcast
struct TvBroadcast: Codable {
    let id: Int
    let market: Market
    let countryCode: CountryCode
    let network: String
    let sequenceNumber: Int
}

enum CountryCode: String, Codable {
    case ca = "CA"
    case us = "US"
}

enum Market: String, Codable {
    case a = "A"
    case h = "H"
    case n = "N"
}

// MARK: - Venue
struct Venue: Codable {
    let venueDefault: String
    let fr, es: String?

    enum CodingKeys: String, CodingKey {
        case venueDefault = "default"
        case fr, es
    }
}

// MARK: - WinningGoal
struct WinningGoal: Codable {
    let playerID: Int
    let firstInitial, lastName: PlaceName

    enum CodingKeys: String, CodingKey {
        case playerID = "playerId"
        case firstInitial, lastName
    }
}

// MARK: - OddsPartner
struct OddsPartner: Codable {
    let partnerID: Int
    let country, name: String
    let imageURL: String
    let siteURL: String?
    let bgColor, textColor, accentColor: String

    enum CodingKeys: String, CodingKey {
        case partnerID = "partnerId"
        case country, name
        case imageURL = "imageUrl"
        case siteURL = "siteUrl"
        case bgColor, textColor, accentColor
    }
}

