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
    
    func refereeList(_ referees: [Venue]) -> String {
        return referees
            .map { "\($0.venueDefault)" }
            .joined(separator: ", ")
    }
    
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
            
            VStack {
                Text("Score by Period")
                HStack {
                    Text(boxScoreData?.awayTeam.abbrev ?? "")
                        .frame(width: 50, alignment: .leading)
                    if let byPeriod = boxScoreData?.boxscore.linescore.byPeriod {
                        ForEach(byPeriod.indices, id: \.self) { index in
                            let period = byPeriod[index]
                            Text(String(period.away))
                                .frame(width: 20, alignment: .leading)
                        }
                        Text(String(boxScoreData?.boxscore.linescore.totals.away ?? 0))
                            .frame(width: 20, alignment: .leading)
                    }
                }
                
                VStack {
                    HStack {
                        Text("SOG")
                            .frame(width: 50, alignment: .leading)
                        if let shotsByPeriod = boxScoreData?.boxscore.shotsByPeriod {
                            ForEach(shotsByPeriod.indices, id: \.self) { index in
                                let shots = shotsByPeriod[index]
                                Text(String(shots.away))
                                    .frame(width: 20, alignment: .leading)
                            }
                        }
                        Text(String(boxScoreData?.awayTeam.sog ?? 0))
                    }
                }
                
                HStack {
                    Text(boxScoreData?.homeTeam.abbrev ?? "")
                        .frame(width: 50, alignment: .leading)
                    if let byPeriod = boxScoreData?.boxscore.linescore.byPeriod {
                        ForEach(byPeriod.indices, id: \.self) { index in
                            let period = byPeriod[index]
                            Text(String(period.home))
                                .frame(width: 20, alignment: .leading)
                        }
                        Text(String(boxScoreData?.boxscore.linescore.totals.home ?? 0))
                            .frame(width: 20, alignment: .leading)
                        
                    }
                }
                
                VStack {
                    HStack {
                        Text("SOG")
                            .frame(width: 50, alignment: .leading)
                        if let shotsByPeriod = boxScoreData?.boxscore.shotsByPeriod {
                            ForEach(shotsByPeriod.indices, id: \.self) { index in
                                let shots = shotsByPeriod[index]
                                Text(String(shots.home))
                                    .frame(width: 20, alignment: .leading)
                            }
                        }
                        Text(String(boxScoreData?.homeTeam.sog ?? 0))
                    }
                }
                
                VStack{
                    Text("Referees: \(refereeList(boxScoreData?.boxscore.gameInfo.referees ?? []))")
                        .font(.caption2)
                    Text("Linesmen: \(refereeList(boxScoreData?.boxscore.gameInfo.linesmen ?? []))")
                        .font(.caption2)
                    let highlightsUrl = URL(string: "https://www.nhl.com\(urlString)")
                    Button(action: {
                        UIApplication.shared.open(highlightsUrl!)
                    }) {
                        Text("Highlights")
                            .foregroundColor(/*@START_MENU_TOKEN@*/.blue/*@END_MENU_TOKEN@*/)
                            .font(.subheadline)
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
}

/*#Preview {
    NHLBoxScoreView()
}*/
