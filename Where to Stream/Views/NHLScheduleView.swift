//
//  NHLScheduleView.swift
//  Where to Stream
//
//  Created by William Faucett on 1/30/24.
//

import SwiftUI

struct GameView: View {
    let game: Game
    
    func convertToCurrentTimezone(startTimeUTC: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        guard let utcDate = dateFormatter.date(from: startTimeUTC) else {
            return nil
        }
        
        dateFormatter.timeZone = TimeZone.current
        dateFormatter.dateFormat = "h:mm a"
        
        return dateFormatter.string(from: utcDate)
    }
    
    func getLastPeriodValue(lastPeriod: String) -> String {
        switch lastPeriod {
        case "REG":
            return "Final"
        case "OT":
            return "Final OT"
        case "SO":
            return "Final SO"
        default:
            return lastPeriod
        }
    }

    var body: some View {
        let faceoffTime = String(convertToCurrentTimezone(startTimeUTC: game.startTimeUTC) ?? "Invalid Time")
        let outcome = getLastPeriodValue(lastPeriod: game.gameOutcome?.lastPeriodType ?? "")
        
        VStack(alignment: .leading) {
            Text("Opening Faceoff: \(faceoffTime)")
            Text(game.venue.venueDefault)
            Spacer()
            Text("Away: \(game.awayTeam.placeName.placeNameDefault) \(String(game.awayTeam.score ?? 0))")
            Text("Home: \(game.homeTeam.placeName.placeNameDefault) \(String(game.homeTeam.score ?? 0))")
            Text(outcome)
            if (outcome.contains("Final")){
                Text("GWG: \(game.winningGoalScorer?.firstInitial.placeNameDefault ?? "error"). \(game.winningGoalScorer?.lastName.placeNameDefault ?? "error")")
                Text("Winning Goaltender: \(game.winningGoalie?.firstInitial.placeNameDefault ?? "error"). \(game.winningGoalie?.lastName.placeNameDefault ?? "error")")
            } else{
                Section(header: Text("TV").font(.caption)){
                    List(game.tvBroadcasts, id: \.id) { broadcast in
                        Text("\(broadcast.market.rawValue): \(broadcast.network) - \(broadcast.countryCode.rawValue)") .font(.caption2)
                    }//.scaledToFill()
                }.scaledToFit()
            }
        }
        .padding()
    }
}

struct GameWeekView: View {
    let gameWeek: GameWeek

    var body: some View {
        Section(header: Text(gameWeek.dayAbbrev)) {
            ForEach(gameWeek.games, id: \.id) { game in
                GameView(game: game)
            }
        }
    }
}

struct NHLScheduleView: View {
    let schedule: [GameWeek]

    var body: some View {
        NavigationView {
            List {
                ForEach(schedule, id: \.dayAbbrev) { gameWeek in
                    GameWeekView(gameWeek: gameWeek)
                }
            }
            .navigationTitle("NHL Schedule")
        }
    }
}

