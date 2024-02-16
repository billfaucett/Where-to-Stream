//
//  NHLPLayerStatRow.swift
//  Where to Stream
//
//  Created by William Faucett on 2/15/24.
//

import SwiftUI
import UIKit
import SVGKit

struct NHLPLayerStatRow: View {
    let playerStats : PlayerStatSummary
    
    var body: some View {
        HStack {
            Text(playerStats.skaterFullName)
                .font(.subheadline)
                .frame(width: 115, alignment: .leading)
            Text(playerStats.positionCode)
                .font(.subheadline)
                .frame(width: 20)
            Text(playerStats.teamAbbrevs)
                .font(.subheadline)
                .frame(width: 35)
            Text(String(playerStats.gamesPlayed))
                .font(.subheadline)
                .frame(width: 25)
            Text(String(playerStats.goals))
                .font(.subheadline)
                .frame(width: 25)
            Text(String(playerStats.assists))
                .font(.subheadline)
                .frame(width: 25)
            Text(String(playerStats.points))
                .font(.subheadline)
                .frame(width: 25)
            Text(String(playerStats.penaltyMinutes))
                .font(.subheadline)
                .frame(width: 25)
            Text(playerStats.plusMinus > 0 ? "+\(playerStats.plusMinus)" : "\(playerStats.plusMinus)")
                .font(.subheadline)
                .frame(width: 35)
        }
    }
}

struct NHLPlayerStatRow_Preview :PreviewProvider {
    static var player = PlayerStatSummary(assists: 70, evGoals: 30, evPoints: 50, faceoffWinPct: 0.643593, gameWinningGoals: 6, gamesPlayed: 82, goals: 50, lastName: "Faucett", otGoals: 2, penaltyMinutes: 132, playerID: 1, plusMinus: 34, points: 120, pointsPerGame: 1, positionCode: "R", ppGoals: 18, ppPoints: 19, seasonID: 20232024, shGoals: 2, shPoints: 3, shootingPct: 0.18953, shootsCatches: "L", shots: 200, skaterFullName: "Bill Faucett" , teamAbbrevs: "PHI", timeOnIcePerGame: 2500)
    static var previews: some View {
        NHLPLayerStatRow(playerStats: player)
    }
}
