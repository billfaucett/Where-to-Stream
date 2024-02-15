//
//  NHLSkaterStatSummary.swift
//  Where to Stream
//
//  Created by William Faucett on 2/15/24.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct PlayerStats: Codable {
    let data: [PlayerStatSummary]
    let total: Int
}

// MARK: - Datum
struct PlayerStatSummary: Codable {
    let assists, evGoals, evPoints: Int
    let faceoffWinPct: Double?
    let gameWinningGoals, gamesPlayed, goals: Int
    let lastName: String
    let otGoals, penaltyMinutes, playerID, plusMinus: Int
    let points: Int
    let pointsPerGame: Double
    let positionCode: String
    let ppGoals, ppPoints, seasonID, shGoals: Int
    let shPoints: Int
    let shootingPct: Double?
    let shootsCatches: String
    let shots: Int
    let skaterFullName, teamAbbrevs: String
    let timeOnIcePerGame: Double

    enum CodingKeys: String, CodingKey {
        case assists, evGoals, evPoints, faceoffWinPct, gameWinningGoals, gamesPlayed, goals, lastName, otGoals, penaltyMinutes
        case playerID = "playerId"
        case plusMinus, points, pointsPerGame, positionCode, ppGoals, ppPoints
        case seasonID = "seasonId"
        case shGoals, shPoints, shootingPct, shootsCatches, shots, skaterFullName, teamAbbrevs, timeOnIcePerGame
    }
}

enum ShootsCatches: String, Codable {
    case l = "L"
    case r = "R"
}

