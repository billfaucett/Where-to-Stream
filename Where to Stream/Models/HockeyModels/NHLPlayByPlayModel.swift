//
//  NHLPlayByPlayModel.swift
//  Where to Stream
//
//  Created by William Faucett on 2/2/24.
//

// This file was generated from JSON Schema using quicktype, do not modify it directly.
// To parse the JSON, add this file to your project and do:
//
//   let welcome = try? JSONDecoder().decode(Welcome.self, from: jsonData)

import Foundation

// MARK: - Welcome
struct PlayByPlay: Codable {
    let id, season, gameType: Int
    let gameDate: String
    let venue: Venue
    let startTimeUTC: String
    let easternUTCOffset, venueUTCOffset: String
    let tvBroadcasts: [TvBroadcast]
    let gameState, gameScheduleState: String
    let period: Int
    let periodDescriptor: PeriodDescriptor
    let awayTeam, homeTeam: Team
    let clock: Clock
    let rosterSpots: [RosterSpot]
    let displayPeriod: Int
    let gameOutcome: GameOutcome
    let plays: [Play]
}

enum PeriodType: String, Codable {
    case reg = "REG"
}

// MARK: - Play
struct Play: Codable {
    let eventID, period: Int
    let periodDescriptor: PeriodDescriptor
    let timeInPeriod, timeRemaining: String
    let situationCode: String?
    let homeTeamDefendingSide: HomeTeamDefendingSide
    let typeCode: Int
    let typeDescKey: TypeDescKey
    let sortOrder: Int
    let details: Details?

    enum CodingKeys: String, CodingKey {
        case eventID = "eventId"
        case period, periodDescriptor, timeInPeriod, timeRemaining, situationCode, homeTeamDefendingSide, typeCode, typeDescKey, sortOrder, details
    }
}

// MARK: - Details
struct Details: Codable {
    let eventOwnerTeamID, losingPlayerID, winningPlayerID, xCoord: Int?
    let yCoord: Int?
    let zoneCode: ZoneCode?
    let blockingPlayerID, shootingPlayerID, hittingPlayerID, hitteePlayerID: Int?
    let reason: String?
    let playerID: Int?
    let shotType: String?
    let goalieInNetID, awaySOG, homeSOG: Int?
    let secondaryReason: String?
    let scoringPlayerID, scoringPlayerTotal, assist1PlayerID, assist1PlayerTotal: Int?
    let awayScore, homeScore: Int?
    let typeCode: String?
    let descKey: String?
    let duration, committedByPlayerID, drawnByPlayerID, assist2PlayerID: Int?
    let assist2PlayerTotal, servedByPlayerID: Int?

    enum CodingKeys: String, CodingKey {
        case eventOwnerTeamID = "eventOwnerTeamId"
        case losingPlayerID = "losingPlayerId"
        case winningPlayerID = "winningPlayerId"
        case xCoord, yCoord, zoneCode
        case blockingPlayerID = "blockingPlayerId"
        case shootingPlayerID = "shootingPlayerId"
        case hittingPlayerID = "hittingPlayerId"
        case hitteePlayerID = "hitteePlayerId"
        case reason
        case playerID = "playerId"
        case shotType
        case goalieInNetID = "goalieInNetId"
        case awaySOG, homeSOG, secondaryReason
        case scoringPlayerID = "scoringPlayerId"
        case scoringPlayerTotal
        case assist1PlayerID = "assist1PlayerId"
        case assist1PlayerTotal, awayScore, homeScore, typeCode, descKey, duration
        case committedByPlayerID = "committedByPlayerId"
        case drawnByPlayerID = "drawnByPlayerId"
        case assist2PlayerID = "assist2PlayerId"
        case assist2PlayerTotal
        case servedByPlayerID = "servedByPlayerId"
    }
    
    func getGoalScorer(playByPlay: PlayByPlay) -> String {
        if let scorerID = scoringPlayerID,
            let scorer = playByPlay.rosterSpots.first(where: { $0.playerID == scorerID }) {
            return "\(scorer.firstName.stNameDefault) \(scorer.lastName.stNameDefault)"
        }
        return "Unknown"
    }

    func getAssists(playByPlay: PlayByPlay) -> String {
        guard let assist1ID = assist1PlayerID,
            let assist2ID = assist2PlayerID,
            let assist1 = playByPlay.rosterSpots.first(where: { $0.playerID == assist1ID }),
            let assist2 = playByPlay.rosterSpots.first(where: { $0.playerID == assist2ID }) else {
            return "None"
        }

        let assist1Name = "\(assist1.firstName.stNameDefault) \(assist1.lastName.stNameDefault)"
        let assist2Name = "\(assist2.firstName.stNameDefault) \(assist2.lastName.stNameDefault)"

        return "\(assist1Name), \(assist2Name)"
    }
    
    func getPenalties(playByPlay: PlayByPlay) -> String {
        if let penalizedId = committedByPlayerID,
            let commitedBy = playByPlay.rosterSpots.first(where: { $0.playerID == penalizedId }) {
            return "\(commitedBy.firstName.stNameDefault) \(commitedBy.lastName.stNameDefault)"
        } else if let servedById = servedByPlayerID,
                  let servedById = playByPlay.rosterSpots.first(where: { $0.playerID == servedById }) {
            return "Served by \(servedById.firstName.stNameDefault) \(servedById.lastName.stNameDefault)"
        }
        return "Unknown"
    }
}

enum ZoneCode: String, Codable {
    case d = "D"
    case n = "N"
    case o = "O"
}

enum HomeTeamDefendingSide: String, Codable {
    case homeTeamDefendingSideLeft = "left"
    case homeTeamDefendingSideRight = "right"
}

enum TypeDescKey: String, Codable {
    case blockedShot = "blocked-shot"
    case delayedPenalty = "delayed-penalty"
    case faceoff = "faceoff"
    case gameEnd = "game-end"
    case giveaway = "giveaway"
    case goal = "goal"
    case hit = "hit"
    case missedShot = "missed-shot"
    case penalty = "penalty"
    case periodEnd = "period-end"
    case periodStart = "period-start"
    case shotOnGoal = "shot-on-goal"
    case stoppage = "stoppage"
    case takeaway = "takeaway"
    case shootoutComplete = "shootout-complete"
    case defaultCase
}

// MARK: - RosterSpot
struct RosterSpot: Codable {
    let teamID, playerID: Int
    let firstName, lastName: StName
    let sweaterNumber: Int
    let positionCode: PositionCode
    let headshot: String

    enum CodingKeys: String, CodingKey {
        case teamID = "teamId"
        case playerID = "playerId"
        case firstName, lastName, sweaterNumber, positionCode, headshot
    }
}

// MARK: - StName
struct StName: Codable {
    let stNameDefault: String
    let cs, sk, fi: String?

    enum CodingKeys: String, CodingKey {
        case stNameDefault = "default"
        case cs, sk, fi
    }
}

enum PositionCode: String, Codable {
    case c = "C"
    case d = "D"
    case g = "G"
    case l = "L"
    case r = "R"
}

// MARK: - Encode/decode helpers

class JSONNull: Codable, Hashable {

    public static func == (lhs: JSONNull, rhs: JSONNull) -> Bool {
        return true
    }

    public func hash(into hasher: inout Hasher) {
        hasher.combine(0)
    }

    public init() {}

    public required init(from decoder: Decoder) throws {
        let container = try decoder.singleValueContainer()
        if !container.decodeNil() {
            throw DecodingError.typeMismatch(JSONNull.self, DecodingError.Context(codingPath: decoder.codingPath, debugDescription: "Wrong type for JSONNull"))
        }
    }

    public func encode(to encoder: Encoder) throws {
        var container = encoder.singleValueContainer()
        try container.encodeNil()
    }
}

class JSONCodingKey: CodingKey {
    let key: String

    required init?(intValue: Int) {
        return nil
    }

    required init?(stringValue: String) {
        key = stringValue
    }

    var intValue: Int? {
        return nil
    }

    var stringValue: String {
        return key
    }
}

class JSONAny: Codable {

    let value: Any

    static func decodingError(forCodingPath codingPath: [CodingKey]) -> DecodingError {
        let context = DecodingError.Context(codingPath: codingPath, debugDescription: "Cannot decode JSONAny")
        return DecodingError.typeMismatch(JSONAny.self, context)
    }

    static func encodingError(forValue value: Any, codingPath: [CodingKey]) -> EncodingError {
        let context = EncodingError.Context(codingPath: codingPath, debugDescription: "Cannot encode JSONAny")
        return EncodingError.invalidValue(value, context)
    }

    static func decode(from container: SingleValueDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if container.decodeNil() {
            return JSONNull()
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout UnkeyedDecodingContainer) throws -> Any {
        if let value = try? container.decode(Bool.self) {
            return value
        }
        if let value = try? container.decode(Int64.self) {
            return value
        }
        if let value = try? container.decode(Double.self) {
            return value
        }
        if let value = try? container.decode(String.self) {
            return value
        }
        if let value = try? container.decodeNil() {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer() {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decode(from container: inout KeyedDecodingContainer<JSONCodingKey>, forKey key: JSONCodingKey) throws -> Any {
        if let value = try? container.decode(Bool.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Int64.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(Double.self, forKey: key) {
            return value
        }
        if let value = try? container.decode(String.self, forKey: key) {
            return value
        }
        if let value = try? container.decodeNil(forKey: key) {
            if value {
                return JSONNull()
            }
        }
        if var container = try? container.nestedUnkeyedContainer(forKey: key) {
            return try decodeArray(from: &container)
        }
        if var container = try? container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key) {
            return try decodeDictionary(from: &container)
        }
        throw decodingError(forCodingPath: container.codingPath)
    }

    static func decodeArray(from container: inout UnkeyedDecodingContainer) throws -> [Any] {
        var arr: [Any] = []
        while !container.isAtEnd {
            let value = try decode(from: &container)
            arr.append(value)
        }
        return arr
    }

    static func decodeDictionary(from container: inout KeyedDecodingContainer<JSONCodingKey>) throws -> [String: Any] {
        var dict = [String: Any]()
        for key in container.allKeys {
            let value = try decode(from: &container, forKey: key)
            dict[key.stringValue] = value
        }
        return dict
    }

    static func encode(to container: inout UnkeyedEncodingContainer, array: [Any]) throws {
        for value in array {
            if let value = value as? Bool {
                try container.encode(value)
            } else if let value = value as? Int64 {
                try container.encode(value)
            } else if let value = value as? Double {
                try container.encode(value)
            } else if let value = value as? String {
                try container.encode(value)
            } else if value is JSONNull {
                try container.encodeNil()
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer()
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout KeyedEncodingContainer<JSONCodingKey>, dictionary: [String: Any]) throws {
        for (key, value) in dictionary {
            let key = JSONCodingKey(stringValue: key)!
            if let value = value as? Bool {
                try container.encode(value, forKey: key)
            } else if let value = value as? Int64 {
                try container.encode(value, forKey: key)
            } else if let value = value as? Double {
                try container.encode(value, forKey: key)
            } else if let value = value as? String {
                try container.encode(value, forKey: key)
            } else if value is JSONNull {
                try container.encodeNil(forKey: key)
            } else if let value = value as? [Any] {
                var container = container.nestedUnkeyedContainer(forKey: key)
                try encode(to: &container, array: value)
            } else if let value = value as? [String: Any] {
                var container = container.nestedContainer(keyedBy: JSONCodingKey.self, forKey: key)
                try encode(to: &container, dictionary: value)
            } else {
                throw encodingError(forValue: value, codingPath: container.codingPath)
            }
        }
    }

    static func encode(to container: inout SingleValueEncodingContainer, value: Any) throws {
        if let value = value as? Bool {
            try container.encode(value)
        } else if let value = value as? Int64 {
            try container.encode(value)
        } else if let value = value as? Double {
            try container.encode(value)
        } else if let value = value as? String {
            try container.encode(value)
        } else if value is JSONNull {
            try container.encodeNil()
        } else {
            throw encodingError(forValue: value, codingPath: container.codingPath)
        }
    }

    public required init(from decoder: Decoder) throws {
        if var arrayContainer = try? decoder.unkeyedContainer() {
            self.value = try JSONAny.decodeArray(from: &arrayContainer)
        } else if var container = try? decoder.container(keyedBy: JSONCodingKey.self) {
            self.value = try JSONAny.decodeDictionary(from: &container)
        } else {
            let container = try decoder.singleValueContainer()
            self.value = try JSONAny.decode(from: container)
        }
    }

    public func encode(to encoder: Encoder) throws {
        if let arr = self.value as? [Any] {
            var container = encoder.unkeyedContainer()
            try JSONAny.encode(to: &container, array: arr)
        } else if let dict = self.value as? [String: Any] {
            var container = encoder.container(keyedBy: JSONCodingKey.self)
            try JSONAny.encode(to: &container, dictionary: dict)
        } else {
            var container = encoder.singleValueContainer()
            try JSONAny.encode(to: &container, value: self.value)
        }
    }
}

