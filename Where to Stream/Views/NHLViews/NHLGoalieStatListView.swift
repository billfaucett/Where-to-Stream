//
//  NHLGoalieStatListView.swift
//  Where to Stream
//
//  Created by William Faucett on 2/15/24.
//

import SwiftUI

struct NHLGoalieStatListView: View {
    var stats: GoalieData
    var team: String?
    
    var body: some View {
        VStack {
            let totalGames = team == nil ? stats.data.reduce(0) { $0 + $1.gamesPlayed } : 0
            let avgGames = team == nil ? totalGames/stats.data.count : 1
            let filteredGoalies = stats.data.sorted { $0.goalsAgainstAverage < $1.goalsAgainstAverage }
            let leaderGoalies = avgGames > 10 ? filteredGoalies .filter { $0.gamesPlayed >= avgGames / 4 } : filteredGoalies
            let goalies = team == nil ? leaderGoalies : leaderGoalies.filter { $0.teamAbbrevs == team }
            let sortedByGAA = goalies .prefix(25)

            Section(header: team != nil ? Text("\(team!) Goaltending") : Text("NHL Top 25 Goalies")){
                HStack {
                    Text("Player")
                        .frame(width: 100, alignment: .center)
                        .font(.subheadline)
                    Text("GP")
                        .frame(width: 25)
                        .font(.subheadline)
                    Text("W")
                        .frame(width: 25)
                        .font(.subheadline)
                    Text("L")
                        .frame(width: 25)
                        .font(.subheadline)
                    Text("OL")
                        .frame(width: 25)
                        .font(.subheadline)
                    Text("GAA")
                        .frame(width: 50)
                        .font(.subheadline)
                    Text("Sv%")
                        .frame(width: 50)
                        .font(.subheadline)
                    Text("SO")
                        .frame(width: 25)
                        .font(.subheadline)
                }
                ForEach (sortedByGAA, id: \.playerID) { stat in
                    NHLGoalieStatRow(goalie: stat)
                }
            }
        }
    }
}

struct NHLGoalieStatListView_Preview: PreviewProvider {
    static var stats = getStatsFromJSON()
    
    
    static var previews: some View {
        NHLGoalieStatListView(stats: stats)
    }
    
    static func getStatsFromJSON() -> GoalieData {
        guard let url = Bundle.main.url(forResource: "GoalieStatSummary", withExtension: "json") else {
            fatalError("Failed to locate JSON file in bundle.")
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let stats = try decoder.decode(GoalieData.self, from: data)
            return stats
            
        } catch {
            fatalError("Failed to decode JSON: \(error)")
        }
    }
}
