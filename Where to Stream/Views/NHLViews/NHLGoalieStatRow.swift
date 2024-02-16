//
//  NHLGoalieStatRow.swift
//  Where to Stream
//
//  Created by William Faucett on 2/15/24.
//

import SwiftUI

struct NHLGoalieStatRow: View {
    let goalie : GoalieDatum
    
    var body: some View {
        HStack{
            Text(goalie.goalieFullName)
            Text(String(goalie.gamesPlayed))
            Text(String(goalie.wins))
            Text(String(goalie.losses))
            Text(String(goalie.otLosses))
            Text(String(goalie.goalsAgainstAverage))
            Text(String(goalie.savePct.rounded(toPlaces: 3)))
            Text(String(goalie.shutouts))
        }
    }
}

struct NHLGoalieStatRow_Preview: PreviewProvider {
    static var goalie = GoalieDatum(assists: 6, gamesPlayed: 45, gamesStarted: 45, goalieFullName: "Bob Sacomano", goals: 0, goalsAgainst: 100, goalsAgainstAverage: 2.15, lastName: "Sacomano", losses: 11, otLosses: 4, penaltyMinutes: 18, playerID: 12, points: 6, savePct: 0.9345, saves: 1454, seasonID: 20232024, shootsCatches: "L", shotsAgainst: 2658, shutouts: 6, teamAbbrevs: "PHI", ties: 0, timeOnIce: 4135, wins: 30)
    
    static var previews: some View {
        NHLGoalieStatRow(goalie: goalie)
    }
}
