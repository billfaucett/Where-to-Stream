//
//  GoalieStatsModel.swift
//  Where to Stream
//
//  Created by William Faucett on 2/15/24.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//

import Foundation

// MARK: - Welcome
struct GoalieData: Codable {
    var data: [GoalieDatum]
    let total: Int
}

// MARK: - Datum
struct GoalieDatum: Codable {
    let assists, gamesPlayed, gamesStarted: Int
    let goalieFullName: String
    let goals, goalsAgainst: Int
    let goalsAgainstAverage: Double
    let lastName: String
    let losses, otLosses, penaltyMinutes, playerID: Int
    let points: Int
    let savePct: Double
    let saves, seasonID: Int
    let shootsCatches: String
    let shotsAgainst, shutouts: Int
    let teamAbbrevs: String
    let ties: Int?
    let timeOnIce, wins: Int

    enum CodingKeys: String, CodingKey {
        case assists, gamesPlayed, gamesStarted, goalieFullName, goals, goalsAgainst, goalsAgainstAverage, lastName, losses, otLosses, penaltyMinutes
        case playerID = "playerId"
        case points, savePct, saves
        case seasonID = "seasonId"
        case shootsCatches, shotsAgainst, shutouts, teamAbbrevs, ties, timeOnIce, wins
    }
}
