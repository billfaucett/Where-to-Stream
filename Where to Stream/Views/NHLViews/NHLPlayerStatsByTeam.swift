//
//  NHLPlayerStatsByTeam.swift
//  Where to Stream
//
//  Created by William Faucett on 2/19/24.
//

import SwiftUI

struct NHLPlayerStatsByTeam: View {
    @ObservedObject var nhlViewControler = NHLViewController()
    let teams = ["FLA", "BOS", "TOR", "TBL", "DET", "BUF", "MTL", "OTT", "NYR", "CAR", "PHI", "NJD", "NYI", "WSH", "PIT", "CBJ", "DAL", "COL", "WPG", "STL", "NSH", "MIN", "ARI", "CHI", "VAN", "VGK", "EDM", "LAK", "SEA", "CGY", "ANA", "SJS"]
    @State private var selectedTeamIndex = 0
    @State private var selectedTeam = ""
    @State var showStats = false
    
    var body: some View {
        VStack {
            Picker("Select a Team", selection: $selectedTeam) {
                ForEach(teams.indices, id: \.self) { index in
                    Text(teams[index])
                }
            }
            .pickerStyle(WheelPickerStyle())
            
            Text(teams[selectedTeamIndex])
            Text(String(selectedTeamIndex))
            
            Button("Get Team Player Stats") {
                //nhlViewControler.getNHLPlayerStatSummaryForTeam(team: teams[selectedTeamIndex])
            }
            .onReceive(nhlViewControler.$playerStats) { data in
                if nhlViewControler.playerStats?.data != nil {
                    showStats = true
                }
            }
            .sheet(isPresented: $showStats) {
                if showStats {
                    NHLPlayerStatListView(stats: nhlViewControler.playerStats!, team: selectedTeam)
                }
            }
        }
    }
}

#Preview {
    NHLPlayerStatsByTeam()
}
