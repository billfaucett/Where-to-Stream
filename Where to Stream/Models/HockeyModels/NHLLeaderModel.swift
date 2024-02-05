//
//  LeaderModel.swift
//  Where to Stream
//
//  Created by William Faucett on 2/5/24.
//

struct Player: Codable, Identifiable {
    let id: Int
    let firstName: Venue
    let lastName: Venue
    let sweaterNumber: Int
    let headshot: String
    let teamAbbrev: String
    //let teamName: String
    let teamLogo: String
    let position: String
    let value: Int
}

struct PlayerLeadersResponse: Codable {
    let points: [Player]?
    let goals: [Player]?
    let assists: [Player]?
}
