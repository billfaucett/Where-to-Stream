//
//  NHLBoxScoreView.swift
//  Where to Stream
//
//  Created by William Faucett on 1/31/24.
//

import SwiftUI

struct NHLBoxScoreView: View {
    let gameId: Int
    let urlString: String
    @ObservedObject var nhlViewControler = NHLViewController()
    @State var boxScoreData: GameDetails?
    
    var body: some View {
        VStack(alignment: .leading){
            HStack{
                Text(boxScoreData?.awayTeam.abbrev ?? "Please Work")
                Text(String(boxScoreData?.awayTeam.score ?? 0))
                Text("SOG: \(String(boxScoreData?.awayTeam.sog ?? 0))")
            }
            HStack{
                Text(boxScoreData?.homeTeam.abbrev ?? "Please Work")
                Text(String(boxScoreData?.homeTeam.score ?? 0))
                Text("SOG: \(String(boxScoreData?.homeTeam.sog ?? 0))")
            }
            VStack{
                Text(boxScoreData?.boxscore.gameReports.eventSummary ?? "")
                let highlightsUrl = URL(string: "https://www.nhl.com\(urlString)")
                Button(action: {
                    UIApplication.shared.open(highlightsUrl!)
                }) {
                    Text("Highlights")
                        .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                        .font(.caption)
                }
            }
        }
        .onAppear {
            self.nhlViewControler.getBoxScore(gameId: gameId)
        }
        .onReceive(nhlViewControler.$boxScore){ newBoxScore in
            self.boxScoreData = newBoxScore
        }
    }
}

/*#Preview {
    NHLBoxScoreView()
}*/
