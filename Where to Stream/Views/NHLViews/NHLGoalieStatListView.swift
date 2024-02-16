//
//  NHLGoalieStatListView.swift
//  Where to Stream
//
//  Created by William Faucett on 2/15/24.
//

import SwiftUI

struct NHLGoalieStatListView: View {
    let stats: GoalieData
    
    var body: some View {
        VStack {
            let sortedByGAA = stats.data.sorted {$0.goalsAgainstAverage < $1.goalsAgainstAverage}
                .filter {$0.gamesPlayed >= 5}
                .prefix(25)
            
            Section {
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
