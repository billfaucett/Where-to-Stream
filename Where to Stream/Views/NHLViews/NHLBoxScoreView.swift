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
    @State private var awayLogo: Image?
    @State private var homeLogo: Image?
    
    func refereeList(_ referees: [Venue]) -> String {
        return referees
            .map { "\($0.venueDefault)" }
            .joined(separator: ", ")
    }
    
    func loadImage(url: String, team: String, completion: @escaping (Image?) -> Void) {
        guard let url = URL(string: url.replacingOccurrences(of: "\\/", with: "/")) else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            if let data = data, let uiImage = UIImage(data: data) {
                DispatchQueue.main.async {
                    let image = Image(uiImage: uiImage)
                    if team == "away" {
                        completion(image)
                    } else {
                        completion(image)
                    }
                }
            } else {
                completion(nil)
            }
        }.resume()
    }
    
    var body: some View {
        VStack(alignment: .leading){
            HStack {
                if let awayLogo = awayLogo {
                    awayLogo
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                }
                Text(boxScoreData?.awayTeam.name.venueDefault ?? "Please Work")
                Text(String(boxScoreData?.awayTeam.score ?? 0))
                Text("SOG: \(String(boxScoreData?.awayTeam.sog ?? 0))")
            }
            HStack{
                if let homeLogo = homeLogo {
                    homeLogo
                        .resizable()
                        .scaledToFit()
                        .aspectRatio(contentMode: .fit)
                        .frame(width: 200, height: 200)
                }
                Text(boxScoreData?.homeTeam.name.nameDefault ?? "Please Work")
                Text(String(boxScoreData?.homeTeam.score ?? 0))
                Text("SOG: \(String(boxScoreData?.homeTeam.sog ?? 0))")
            }
            VStack {
                Text("Score by Period")
                Text("")
                    .frame(width: 50, alignment: .leading)
                if let periods = boxScoreData?.boxscore.linescore.byPeriod {
                    ForEach(periods.indices, id: \.self) { index in
                        let period = periods[index]
                        Text(String(period.periodDescriptor.number ?? 0))
                            .frame(width: 20, alignment: .leading)
                    }
                    Text("Tot")
                        .frame(width: 20, alignment: .leading)
                }
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
                VStack {

                }
                
                VStack {
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
            .onReceive(nhlViewControler.$boxScore) {newBoxScore in
                self.boxScoreData = newBoxScore
                if (nhlViewControler.boxScore != nil) {
                    loadImage(url: nhlViewControler.boxScore?.awayTeam.logo ?? "", team: "away") { image in
                        self.awayLogo = image
                    }
                    loadImage(url: nhlViewControler.boxScore?.homeTeam.logo ?? "", team: "home") { image in
                        self.homeLogo = image
                    }
                }
            }
        }
    }
}

#Preview {
    NHLBoxScoreView(gameId: 1, urlString:  "https://www.nhl.com", nhlViewControler: NHLViewController())
}
