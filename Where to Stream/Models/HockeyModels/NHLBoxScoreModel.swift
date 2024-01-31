//
//  NHLBoxScoreView.swift
//  Where to Stream
//
//  Created by William Faucett on 1/31/24.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct GameDetails: Codable {
    let id, season, gameType: Int
    let gameDate: String
    let venue: Venue
    let startTimeUTC: String
    let easternUTCOffset, venueUTCOffset: String
    let tvBroadcasts: [TvBroadcast]
    let gameState, gameScheduleState: String
    let period: Int
    let periodDescriptor: PeriodDescriptor
    let awayTeam: AwayTeam
    let homeTeam: HomeTeam
    let clock: Clock
    let boxscore: Boxscore
    let gameOutcome: GameOutcome
    let gameVideo: GameVideo
}

// MARK: - WelcomeAwayTeam
struct AwayTeam: Codable {
    let id: Int
    let name: Venue
    let abbrev: String
    let score, sog: Int
    //let faceoffWinningPctg: Int
    let powerPlayConversion: String
    let pim, hits, blocks: Int
    let logo: String
}

// MARK: - Boxscore
struct Boxscore: Codable {
    let linescore: Linescore
    let shotsByPeriod: [ByPeriod]
    let gameReports: GameReports
    let playerByGameStats: PlayerByGameStats
    let gameInfo: GameInfo
}

// MARK: - GameInfo
struct GameInfo: Codable {
    let referees, linesmen: [Venue]
    let awayTeam: GameInfoAwayTeam
    let homeTeam: GameInfoHomeTeam
}

// MARK: - GameInfoAwayTeam
struct GameInfoAwayTeam: Codable {
    let headCoach: Venue
    let scratches: [AwayTeamScratch]
}

// MARK: - AwayTeamScratch
struct AwayTeamScratch: Codable {
    let id: Int
    let firstName, lastName: Venue
}

// MARK: - GameInfoHomeTeam
struct GameInfoHomeTeam: Codable {
    let headCoach: Venue
    let scratches: [HomeTeamScratch]
}

// MARK: - HomeTeamScratch
struct HomeTeamScratch: Codable {
    let id: Int
    let firstName: Venue
    let lastName: LastName
}

// MARK: - LastName
struct LastName: Codable {
    let lastNameDefault: String
    let cs, de, es, fi: String?
    let sk, sv: String?

    enum CodingKeys: String, CodingKey {
        case lastNameDefault = "default"
        case cs, de, es, fi, sk, sv
    }
}

// MARK: - GameReports
struct GameReports: Codable {
    let gameSummary, eventSummary, playByPlay, faceoffSummary: String
    let faceoffComparison, rosters, shotSummary: String
    let shiftChart: String
    let toiAway, toiHome: String
}

// MARK: - Linescore
struct Linescore: Codable {
    let byPeriod: [ByPeriod]
    let totals: Totals
}

// MARK: - ByPeriod
struct ByPeriod: Codable {
    let period: Int
    let periodDescriptor: PeriodDescriptor
    let away, home: Int
}

// MARK: - Totals
struct Totals: Codable {
    let away, home: Int
}

// MARK: - PlayerByGameStats
struct PlayerByGameStats: Codable {
    let awayTeam: PlayerByGameStatsAwayTeam
    let homeTeam: PlayerByGameStatsHomeTeam
}

// MARK: - PlayerByGameStatsAwayTeam
struct PlayerByGameStatsAwayTeam: Codable {
    let forwards: [Forward]
    let defense: [Defense]
    let goalies: [Goalie]
}

// MARK: - Defense
struct Defense: Codable {
    let playerID, sweaterNumber: Int
    let name: Venue
    let position: Position
    let goals, assists, points, plusMinus: Int
    let pim, hits, blockedShots, powerPlayGoals: Int
    let powerPlayPoints, shorthandedGoals, shPoints, shots: Int
    let faceoffs: String
    //let faceoffWinningPctg: Int
    let toi, powerPlayToi, shorthandedToi: String

    enum CodingKeys: String, CodingKey {
        case playerID = "playerId"
        case sweaterNumber, name, position, goals, assists, points, plusMinus, pim, hits, blockedShots, powerPlayGoals, powerPlayPoints, shorthandedGoals, shPoints, shots, faceoffs, /*faceoffWinningPctg,*/ toi, powerPlayToi, shorthandedToi
    }
}

enum Position: String, Codable {
    case c = "C"
    case d = "D"
    case l = "L"
    case r = "R"
}

// MARK: - Forward
struct Forward: Codable {
    let playerID, sweaterNumber: Int
    let name: ForwardName
    let position: Position
    let goals, assists, points, plusMinus: Int
    let pim, hits, blockedShots, powerPlayGoals: Int
    let powerPlayPoints, shorthandedGoals, shPoints, shots: Int
    let faceoffs: String
    //let faceoffWinningPctg: Double
    let toi, powerPlayToi, shorthandedToi: String

    enum CodingKeys: String, CodingKey {
        case playerID = "playerId"
        case sweaterNumber, name, position, goals, assists, points, plusMinus, pim, hits, blockedShots, powerPlayGoals, powerPlayPoints, shorthandedGoals, shPoints, shots, faceoffs, /*faceoffWinningPctg,*/ toi, powerPlayToi, shorthandedToi
    }
}

// MARK: - ForwardName
struct ForwardName: Codable {
    let nameDefault: String
    let cs, fi, sk: String?

    enum CodingKeys: String, CodingKey {
        case nameDefault = "default"
        case cs, fi, sk
    }
}

// MARK: - Goalie
struct Goalie: Codable {
    let playerID, sweaterNumber: Int
    let name: Venue
    let position, evenStrengthShotsAgainst, powerPlayShotsAgainst, shorthandedShotsAgainst: String
    let saveShotsAgainst: String
    let evenStrengthGoalsAgainst, powerPlayGoalsAgainst, shorthandedGoalsAgainst, pim: Int
    let goalsAgainst: Int
    let toi: String
    let savePctg: String?

    enum CodingKeys: String, CodingKey {
        case playerID = "playerId"
        case sweaterNumber, name, position, evenStrengthShotsAgainst, powerPlayShotsAgainst, shorthandedShotsAgainst, saveShotsAgainst, evenStrengthGoalsAgainst, powerPlayGoalsAgainst, shorthandedGoalsAgainst, pim, goalsAgainst, toi, savePctg
    }
}

// MARK: - PlayerByGameStatsHomeTeam
struct PlayerByGameStatsHomeTeam: Codable {
    let forwards, defense: [Forward]
    let goalies: [Goalie]
}

// MARK: - Clock
struct Clock: Codable {
    let timeRemaining: String
    let secondsRemaining: Int
    let running, inIntermission: Bool
}

// MARK: - GameVideo
struct GameVideo: Codable {
    let threeMinRecap, threeMinRecapFr, condensedGame: Int
}

// MARK: - WelcomeHomeTeam
struct HomeTeam: Codable {
    let id: Int
    let name: HomeTeamName
    let abbrev: String
    let score, sog: Int
    //let faceoffWinningPctg: Int
    let powerPlayConversion: String
    let pim, hits, blocks: Int
    let logo: String
}

// MARK: - HomeTeamName
struct HomeTeamName: Codable {
    let nameDefault: String
    let fr: String?

    enum CodingKeys: String, CodingKey {
        case nameDefault = "default"
        case fr
    }
}
