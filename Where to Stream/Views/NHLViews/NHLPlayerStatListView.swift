//
//  NHLPlayerStatListView.swift
//  Where to Stream
//
//  Created by William Faucett on 2/15/24.
//

import SwiftUI

struct NHLPlayerStatListView: View {
    let stats: PlayerStats
    
    var body: some View {
        VStack{
            let sortedByPoints = stats.data.sorted { $0.points > $1.points}.prefix(50)
            
            Section(header: Text("NHL Top 50 Scorers")) {
                ScrollView {
                    HStack {
                        Text("Player")
                            .font(.subheadline)
                            .frame(width: 115, alignment: .center)
                        Text("")
                            .font(.subheadline)
                            .frame(width: 20)
                        Text("")
                            .font(.subheadline)
                            .frame(width: 35)
                        Text(String("GP"))
                            .font(.subheadline)
                            .frame(width: 25)
                        Text(String("G"))
                            .font(.subheadline)
                            .frame(width: 25)
                        Text(String("A"))
                            .font(.subheadline)
                            .frame(width: 25)
                        Text(String("Pts"))
                            .font(.subheadline)
                            .frame(width: 25)
                        Text(String("PIM"))
                            .font(.caption)
                            .frame(width: 25)
                        Text(String("+/-"))
                            .font(.subheadline)
                            .frame(width: 35)
                        Divider()
                    }
                    ForEach(sortedByPoints, id: \.playerID) { playerStat in
                        NHLPLayerStatRow(playerStats: playerStat)
                    }
                }
            }
        }
    }
}

struct NHLPlayerStatListView_Preview: PreviewProvider {
    static var previews: some View {
        let stats = getStatsFromJSON()
        NHLPlayerStatListView(stats: stats)
    }
    
    static func getStatsFromJSON() -> PlayerStats {
        guard let url = Bundle.main.url(forResource: "PlayerStatSummary", withExtension: "json") else {
            fatalError("Failed to locate JSON file in bundle.")
        }
        
        do {
            let data = try Data(contentsOf: url)
            let decoder = JSONDecoder()
            let stats = try decoder.decode(PlayerStats.self, from: data)
            return stats
            
        } catch {
            fatalError("Failed to decode JSON: \(error)")
        }
    }
}
