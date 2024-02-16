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
                .frame(width: 100, alignment: .leading)
                .font(.subheadline)
            Text(String(goalie.gamesPlayed))
                .frame(width: 25)
                .font(.subheadline)
            Text(String(goalie.wins))
                .frame(width: 25)
                .font(.subheadline)
            Text(String(goalie.losses))
                .frame(width: 25)
                .font(.subheadline)
            Text(String(goalie.otLosses))
                .frame(width: 25)
                .font(.subheadline)
            Text(String(goalie.goalsAgainstAverage.rounded(toPlaces: 2)))
                .frame(width: 50)
                .font(.subheadline)
            Text(String(goalie.savePct.rounded(toPlaces: 3)))
                .frame(width: 50)
                .font(.subheadline)
            Text(String(goalie.shutouts))
                .frame(width: 25)
                .font(.subheadline)
        }
    }
}

struct NHLGoalieStatRow_Preview: PreviewProvider {
    static var goalie = GoalieDatum(assists: 6, gamesPlayed: 45, gamesStarted: 45, goalieFullName: "Bob Sacomano", goals: 0, goalsAgainst: 100, goalsAgainstAverage: 2.15, lastName: "Sacomano", losses: 11, otLosses: 4, penaltyMinutes: 18, playerID: 12, points: 6, savePct: 0.9345, saves: 1454, seasonID: 20232024, shootsCatches: "L", shotsAgainst: 2658, shutouts: 6, teamAbbrevs: "PHI", ties: 0, timeOnIce: 4135, wins: 30)
    
    static var previews: some View {
        NHLGoalieStatRow(goalie: goalie)
    }
}
