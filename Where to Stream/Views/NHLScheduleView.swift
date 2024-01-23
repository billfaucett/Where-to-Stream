//
//  NHLScheduleView.swift
//  Where to Stream
//
//  Created by William Faucett on 1/30/24.
//

import SwiftUI

struct NHLScheduleView: View {
    let schedule : [GameWeek]
    
    var body: some View {
        Text(/*@START_MENU_TOKEN@*/"Hello, World!"/*@END_MENU_TOKEN@*/)
        Text(schedule.first?.dayAbbrev ?? "default value")
        NavigationView {
            List {
                ForEach(schedule, id: \.dayAbbrev) { gameWeek in
                    Section(header: Text(gameWeek.dayAbbrev)) {
                        ForEach(gameWeek.games, id: \.id) { game in
                            // Display information for each game in a row
                            var awayScore = String(game.awayTeam.score ?? "0")
                            var homeScore = String(game.homeTeam.score ?? "0")
                            
                            VStack(alignment: .leading) {
                                Text("Start Time: \(game.startTimeUTC)")
                                Text("Away: \(game.awayTeam.abbrev)")
                                Text("Away Score: \(awayScore)")
                                Text("Home: \(game.homeTeam.abbrev)")
                                Text("Home Score \(homeScore)")
                                Text("Site: \( game.venue.venueDefault)")
                            }
                            .padding()
                        }
                    }
                }
            }
            .navigationTitle("NHL Schedule")
        }
    }
}
