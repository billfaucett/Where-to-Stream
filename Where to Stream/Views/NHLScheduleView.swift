//
//  NHLScheduleView.swift
//  Where to Stream
//
//  Created by William Faucett on 1/30/24.
//

import SwiftUI

struct GameView: View {
    let game: Game
    
    func convertToEasternTime(startTimeUTC: String) -> String? {
        let dateFormatter = DateFormatter()
        dateFormatter.dateFormat = "yyyy-MM-dd'T'HH:mm:ssZ"
        
        guard let utcDate = dateFormatter.date(from: startTimeUTC) else {
            return nil
        }
        
        dateFormatter.timeZone = TimeZone(identifier: "America/New_York")
        dateFormatter.dateFormat = "h:mm a"
        
        return dateFormatter.string(from: utcDate)
    }

    var body: some View {
        let faceoffTime = String(convertToEasternTime(startTimeUTC: game.startTimeUTC) ?? "Invalid Time")
        
        VStack(alignment: .leading) {
            Text("Start Time: \(faceoffTime) ET")
            Text(game.venue.venueDefault)
            Spacer()
            Text("Away: \(game.awayTeam.abbrev) \(String(game.awayTeam.score ?? 0))")
            Text("Home: \(game.homeTeam.abbrev) \(String(game.homeTeam.score ?? 0))")
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

