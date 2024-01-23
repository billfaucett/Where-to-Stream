//
//  NHLStandingsModel.swift
//  Where to Stream
//
//  Created by William Faucett on 1/29/24.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct Standings: Codable {
    let wildCardIndicator: Bool
    let standings: [Standing]
}

// MARK: - Standing
struct Standing: Codable {
    let conferenceAbbrev: ConferenceAbbrev
    let conferenceHomeSequence, conferenceL10Sequence: Int
    let conferenceName: ConferenceName
    let conferenceRoadSequence, conferenceSequence: Int
    let date: String
    let divisionAbbrev: DivisionAbbrev
    let divisionHomeSequence, divisionL10Sequence: Int
    let divisionName: DivisionName
    let divisionRoadSequence, divisionSequence, gameTypeID, gamesPlayed: Int
    let goalDifferential: Int
    let goalDifferentialPctg: Double
    let goalAgainst, goalFor: Int
    let goalsForPctg: Double
    let homeGamesPlayed, homeGoalDifferential, homeGoalsAgainst, homeGoalsFor: Int
    let homeLosses, homeOtLosses, homePoints, homeRegulationPlusOtWINS: Int
    let homeRegulationWINS, homeTies, homeWINS, l10GamesPlayed: Int
    let l10GoalDifferential, l10GoalsAgainst, l10GoalsFor, l10Losses: Int
    let l10OtLosses, l10Points, l10RegulationPlusOtWINS, l10RegulationWINS: Int
    let l10Ties, l10WINS, leagueHomeSequence, leagueL10Sequence: Int
    let leagueRoadSequence, leagueSequence, losses, otLosses: Int
    let placeName: Name
    let pointPctg: Double
    let points: Int
    let regulationPlusOtWinPctg: Double
    let regulationPlusOtWINS: Int
    let regulationWinPctg: Double
    let regulationWINS, roadGamesPlayed, roadGoalDifferential, roadGoalsAgainst: Int
    let roadGoalsFor, roadLosses, roadOtLosses, roadPoints: Int
    let roadRegulationPlusOtWINS, roadRegulationWINS, roadTies, roadWINS: Int
    let seasonID, shootoutLosses, shootoutWINS: Int
    let streakCode: StreakCode
    let streakCount: Int
    let teamName, teamCommonName: Name
    let teamAbbrev: TeamAbbrev
    let teamLogo: String
    let ties, waiversSequence, wildcardSequence: Int
    let winPctg: Double
    let wins: Int

    enum CodingKeys: String, CodingKey {
        case conferenceAbbrev, conferenceHomeSequence, conferenceL10Sequence, conferenceName, conferenceRoadSequence, conferenceSequence, date, divisionAbbrev, divisionHomeSequence, divisionL10Sequence, divisionName, divisionRoadSequence, divisionSequence
        case gameTypeID = "gameTypeId"
        case gamesPlayed, goalDifferential, goalDifferentialPctg, goalAgainst, goalFor, goalsForPctg, homeGamesPlayed, homeGoalDifferential, homeGoalsAgainst, homeGoalsFor, homeLosses, homeOtLosses, homePoints
        case homeRegulationPlusOtWINS = "homeRegulationPlusOtWins"
        case homeRegulationWINS = "homeRegulationWins"
        case homeTies
        case homeWINS = "homeWins"
        case l10GamesPlayed, l10GoalDifferential, l10GoalsAgainst, l10GoalsFor, l10Losses, l10OtLosses, l10Points
        case l10RegulationPlusOtWINS = "l10RegulationPlusOtWins"
        case l10RegulationWINS = "l10RegulationWins"
        case l10Ties
        case l10WINS = "l10Wins"
        case leagueHomeSequence, leagueL10Sequence, leagueRoadSequence, leagueSequence, losses, otLosses, placeName, pointPctg, points, regulationPlusOtWinPctg
        case regulationPlusOtWINS = "regulationPlusOtWins"
        case regulationWinPctg
        case regulationWINS = "regulationWins"
        case roadGamesPlayed, roadGoalDifferential, roadGoalsAgainst, roadGoalsFor, roadLosses, roadOtLosses, roadPoints
        case roadRegulationPlusOtWINS = "roadRegulationPlusOtWins"
        case roadRegulationWINS = "roadRegulationWins"
        case roadTies
        case roadWINS = "roadWins"
        case seasonID = "seasonId"
        case shootoutLosses
        case shootoutWINS = "shootoutWins"
        case streakCode, streakCount, teamName, teamCommonName, teamAbbrev, teamLogo, ties, waiversSequence, wildcardSequence, winPctg, wins
    }
}

enum ConferenceAbbrev: String, Codable {
    case e = "E"
    case w = "W"
}

enum ConferenceName: String, Codable {
    case eastern = "Eastern"
    case western = "Western"
}

enum DivisionAbbrev: String, Codable {
    case a = "A"
    case c = "C"
    case m = "M"
    case p = "P"
}

enum DivisionName: String, Codable {
    case atlantic = "Atlantic"
    case central = "Central"
    case metropolitan = "Metropolitan"
    case pacific = "Pacific"
}

// MARK: - Name
struct Name: Codable {
    let nameDefault: String
    let fr: String?

    enum CodingKeys: String, CodingKey {
        case nameDefault = "default"
        case fr
    }
}

enum StreakCode: String, Codable {
    case l = "L"
    case ot = "OT"
    case w = "W"
}

// MARK: - TeamAbbrev
struct TeamAbbrev: Codable {
    let teamAbbrevDefault: String

    enum CodingKeys: String, CodingKey {
        case teamAbbrevDefault = "default"
    }
}

