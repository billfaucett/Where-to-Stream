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
    
    func broadcastsList(_ broadcasts: [TvBroadcast]) -> String {
        return broadcasts
            .map { "\($0.market.rawValue): \($0.network) - \($0.countryCode.rawValue)" }
            .joined(separator: ", ")
    }

    var body: some View {
        let faceoffTime = String(convertToCurrentTimezone(startTimeUTC: game.startTimeUTC) ?? "Invalid Time")
        let outcome = getLastPeriodValue(lastPeriod: game.gameOutcome?.lastPeriodType ?? "")
        let period = String(game.periodDescriptor.number ?? 0)

        VStack(alignment: .leading) {
            Text("Opening Faceoff: \(faceoffTime)") 
                .font(.caption .bold())
            Text(game.venue.venueDefault) 
                .font(.caption2)
            VStack {
                HStack {
                    
                    Text(game.awayTeam.placeName?.placeNameDefault ?? "Away Place")
                        .bold()
                        .frame(width: 120, alignment: .leading)
                    Text(String(game.awayTeam.score ?? 0))
                        .bold()
                }
            }
            VStack {
                HStack {
                    Text(game.homeTeam.placeName?.placeNameDefault ?? "Home Place")
                        .bold()
                        .frame(width: 120, alignment: .leading)
                    Text(String(game.homeTeam.score ?? 0))
                        .bold()
                }
            }
            if (period != "0"){
                Text("Period: \(period)") 
                    .font(
                        .caption .bold())
            }
            Text(outcome) 
                .font(
                    .caption .bold())
            if (outcome.contains("Final")){
                NavigationLink("Box Score", destination: NHLBoxScoreView(gameId: game.id, urlString: game.threeMinRecap ?? "https://www.nhl.com"))
                    .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                    .font(.caption)
                Text("GWG: \(game.winningGoalScorer?.firstInitial.placeNameDefault ?? "") \(game.winningGoalScorer?.lastName.placeNameDefault ?? "")")
                    .font(.caption)
                Text("Winning Goaltender: \(game.winningGoalie?.firstInitial.placeNameDefault ?? "error") \(game.winningGoalie?.lastName.placeNameDefault ?? "error")") 
                    .font(.caption)
            } else{
                Text("Broadcasts: \(broadcastsList(game.tvBroadcasts))")
                    .font(.caption2)
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

struct NHLScheduleView_Preview: PreviewProvider {
    static var previews: some View {
        let games = getScheduleFromJSON()
        NHLScheduleView(schedule: games.gameWeek!)
    }
    
    static func getScheduleFromJSON() -> Schedule {
        guard let url = Bundle.main.url(forResource: "Schedule", withExtension: "json") else {
            fatalError("Failed to locate JSON file in bundle.")
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let schedule = try decoder.decode(Schedule.self, from: data)
            return schedule
            
        } catch {
            fatalError("Failed to decode JSON: \(error)")
        }
    }
}

