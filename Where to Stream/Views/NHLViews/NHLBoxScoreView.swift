//
//  NHLBoxScoreView.swift
//  Where to Stream
//
//  Created by William Faucett on 1/31/24.
//

import SwiftUI
import SVGKit
import URLImage

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
    
    func loadSVGImage(url: String, team: String, completion: @escaping (Image?) -> Void) {
        guard let url = URL(string: url.replacingOccurrences(of: "\\/", with: "/")) else {
            completion(nil)
            return
        }

        URLSession.shared.dataTask(with: url) { data, response, error in
            guard let data = data, error == nil else {
                completion(nil)
                return
            }

            // Use SVGKit to parse the SVG data
            let svgImage = SVGKImage(data: data)
            
            // Convert SVG to UIImage
            if let uiImage = svgImage?.uiImage {
                DispatchQueue.main.async {
                    let image = Image(uiImage: uiImage)
                    if team == "away" {
                        completion(image)
                    }
                    else {
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
            Section() {
                HStack {
                    Spacer()
                    if let awayLogo = awayLogo {
                        awayLogo
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                    }
                    Text(boxScoreData?.awayTeam.name.venueDefault ?? "Please Work")
                        .bold()
                        .font(.title2)
                    Text(String(boxScoreData?.awayTeam.score ?? 0))
                        .bold()
                        .frame(width: 25)
                        .font(.title2)
                    //Text("SOG: \(String(boxScoreData?.awayTeam.sog ?? 0))")
                    Spacer()
                    
                    if let homeLogo = homeLogo {
                        homeLogo
                            .resizable()
                            .scaledToFit()
                            .aspectRatio(contentMode: .fit)
                            .frame(width: 40, height: 40)
                    }
                    Text(boxScoreData?.homeTeam.name.nameDefault ?? "Please Work")
                        .bold()
                        .font(.title2)
                    Text(String(boxScoreData?.homeTeam.score ?? 0))
                        .bold()
                        .frame(width: 25)
                        .font(.title2)
                    //Text("SOG: \(String(boxScoreData?.homeTeam.sog ?? 0))")
                    Spacer()
                }
            }
            
            Divider()
            
            VStack {
                Text("Score by Period")
                    .frame(width: 200, alignment: .center)
                    .font(.subheadline)
                    .bold()
                
                Divider()
                
                HStack {
                    Text("")
                        .frame(width: 50, alignment: .leading)
                    if let periods = boxScoreData?.boxscore.linescore.byPeriod {
                        ForEach(periods.indices, id: \.self) { index in
                            let period = periods[index]
                            Text(String(period.periodDescriptor.number ?? 0))
                                .frame(width: 20, alignment: .leading)
                                .font(.subheadline)
                                .bold()
                        }
                        Text("T")
                            .frame(width: 20, alignment: .leading)
                            .bold()
                    }
                }
                HStack {
                    Text(boxScoreData?.awayTeam.abbrev ?? "")
                        .frame(width: 50, alignment: .leading)
                        .bold()
                    if let byPeriod = boxScoreData?.boxscore.linescore.byPeriod {
                        ForEach(byPeriod.indices, id: \.self) { index in
                            let period = byPeriod[index]
                            Text(String(period.away))
                                .frame(width: 20, alignment: .leading)
                                .bold()
                        }
                        Text(String(boxScoreData?.boxscore.linescore.totals.away ?? 0))
                            .frame(width: 20, alignment: .leading)
                            .bold()
                    }
                }
                
                VStack {
                    HStack {
                        Text("SOG")
                            .frame(width: 50, alignment: .leading)
                            .font(.caption)
                        if let shotsByPeriod = boxScoreData?.boxscore.shotsByPeriod {
                            ForEach(shotsByPeriod.indices, id: \.self) { index in
                                let shots = shotsByPeriod[index]
                                Text(String(shots.away))
                                    .frame(width: 20, alignment: .leading)
                                    .font(.subheadline)
                            }
                        }
                        Text(String(boxScoreData?.awayTeam.sog ?? 0))
                            .font(.subheadline)
                    }
                }
                Spacer()
                HStack {
                    Text(boxScoreData?.homeTeam.abbrev ?? "")
                        .frame(width: 50, alignment: .leading)
                        .bold()
                    if let byPeriod = boxScoreData?.boxscore.linescore.byPeriod {
                        ForEach(byPeriod.indices, id: \.self) { index in
                            let period = byPeriod[index]
                            Text(String(period.home))
                                .frame(width: 20, alignment: .leading)
                                .bold()
                        }
                        Text(String(boxScoreData?.boxscore.linescore.totals.home ?? 0))
                            .frame(width: 20, alignment: .leading)
                            .bold()
                    }
                }
                
                VStack {
                    HStack {
                        Text("SOG")
                            .frame(width: 50, alignment: .leading)
                            .font(.caption)
                        if let shotsByPeriod = boxScoreData?.boxscore.shotsByPeriod {
                            ForEach(shotsByPeriod.indices, id: \.self) { index in
                                let shots = shotsByPeriod[index]
                                Text(String(shots.home))
                                    .frame(width: 20, alignment: .leading)
                                    .font(.subheadline)
                            }
                        }
                        Text(String(boxScoreData?.homeTeam.sog ?? 0))
                            .font(.subheadline)
                    }
                }
                
                Divider()
                
                VStack {
                    HStack {
                        Section() {
                            Spacer()
                            VStack {
                                Text("PP")
                                    .font(.subheadline)
                                HStack {
                                    Text(boxScoreData?.awayTeam.abbrev ?? "AWY")
                                        .font(.subheadline)
                                    Text(boxScoreData?.awayTeam.powerPlayConversion ?? "0/0")
                                        .font(.subheadline)
                                }
                                HStack {
                                    Text(boxScoreData?.homeTeam.abbrev ?? "HME")
                                        .font(.subheadline)
                                    Text(boxScoreData?.homeTeam.powerPlayConversion ?? "0/0")
                                        .font(.subheadline)
                                }
                            }
                        }
                        Spacer()
                        Divider()
                        Section() {
                            VStack {
                                Text("Hits")
                                    .font(.subheadline)
                                HStack {
                                    Text(boxScoreData?.awayTeam.abbrev ?? "AWY")
                                        .font(.subheadline)
                                    Text(String(boxScoreData?.awayTeam.hits ?? 0))
                                        .font(.subheadline)
                                }
                                HStack {
                                    Text(boxScoreData?.homeTeam.abbrev ?? "HME")
                                        .font(.subheadline)
                                    Text(String(boxScoreData?.homeTeam.hits ?? 0))
                                        .font(.subheadline)
                                }
                            }
                        }
                        Spacer()
                        Divider()
                        Section() {
                            VStack {
                                Text("Blocks")
                                    .font(.subheadline)
                                HStack {
                                    Text(boxScoreData?.awayTeam.abbrev ?? "AWY")
                                        .font(.subheadline)
                                    Text(String(boxScoreData?.awayTeam.blocks ?? 0))
                                        .font(.subheadline)
                                }
                                HStack {
                                    Text(boxScoreData?.homeTeam.abbrev ?? "HME")
                                        .font(.subheadline)
                                    Text(String(boxScoreData?.homeTeam.blocks ?? 0))
                                        .font(.subheadline)
                                }
                            }
                        }
                        Spacer()
                    }
                }

                Divider()
                
                Text(boxScoreData?.boxscore.gameReports.gameSummary ?? "Summary")
                Text(boxScoreData?.boxscore.gameReports.eventSummary ?? "Events")
                Text(boxScoreData?.boxscore.gameReports.rosters ?? "Rosters")
                
                Divider()
                
                Section(header: Text("Misc:").bold().font(.subheadline).padding(.leading)){
                    VStack {
                        Text(boxScoreData?.venue.venueDefault ?? "Venue Name")
                            .font(.subheadline)
                        
                        Divider()
                        
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
            }
            .onAppear {
                self.nhlViewControler.getBoxScore(gameId: gameId)
            }
            .onReceive(nhlViewControler.$boxScore) {newBoxScore in
                self.boxScoreData = newBoxScore
                if (nhlViewControler.boxScore != nil) {
                    loadSVGImage(url: nhlViewControler.boxScore?.awayTeam.logo ?? "", team: "away") { image in
                        self.awayLogo = image
                    }
                    loadSVGImage(url: nhlViewControler.boxScore?.homeTeam.logo ?? "", team: "home") { image in
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
