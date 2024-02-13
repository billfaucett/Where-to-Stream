//
//  NHLStandingsView.swift
//  Where to Stream
//
//  Created by William Faucett on 1/29/24.
//

import SwiftUI

struct NHLStandingsView: View {
    let standings: [Standing]
    var standingsByDivision: [String: [Standing]] {
        Dictionary(grouping: standings, by: { $0.divisionName.rawValue} )
    }
   
    var standingsByConference: [String: [String: [Standing]]] {
            Dictionary(grouping: standings) { $0.conferenceName.rawValue }
                .mapValues { Dictionary(grouping: $0) { $0.divisionName.rawValue } }
    }

    var body: some View {
        NavigationView {
            List {
                ForEach(standingsByConference.sorted(by: { $0.key < $1.key }), id: \.key) { conference, conferenceDivisions in
                    Section(header: Text("\(conference) Conference") .bold() .font(.headline)) {
                        ForEach(conferenceDivisions.sorted(by: { $0.key < $1.key }), id: \.key) { division, divisionStandings in
                            Section(header: Text("\(division) Division") .font(.headline)) {
                                HStack {
                                    Text("")
                                        .frame(width: 55, alignment: .leading)
                                    Spacer()
                                    Text("W")
                                        .frame(width: 40, alignment: .leading)
                                        .font(.caption)
                                    Spacer()
                                    Text("L")
                                        .frame(width: 40, alignment: .leading)
                                        .font(.caption)
                                    Spacer()
                                    Text("OTL")
                                        .frame(width: 40, alignment: .leading)
                                        .font(.caption)
                                    Spacer()
                                    Text("Pts")
                                        .frame(width: 40, alignment: .leading)
                                        .font(.caption)
                                    Spacer()
                                    Text("GF")
                                        .frame(width: 40, alignment: .leading)
                                        .font(.caption)
                                    Spacer()
                                    Text("GA")
                                        .frame(width: 40, alignment: .leading)
                                        .font(.caption)
                                }
                                .padding(10)
                                ForEach(divisionStandings, id: \.teamAbbrev.teamAbbrevDefault) { standing in
                                    StandingsRow(standing: standing)
                                }
                            }
                        }
                    }
                }
            }
            .navigationTitle("NHL Standings")
        }
    }
}

struct StandingsRow: View {
    let standing: Standing

    var body: some View {
        HStack {
            Text("\(standing.teamAbbrev.teamAbbrevDefault)")
                .bold()
                .frame(width: 55, alignment: .leading)
            Spacer()
            Text("\(standing.wins)")
                .frame(width: 40, alignment: .leading)
            Spacer()
            Text("\(standing.losses)")
                .frame(width: 40, alignment: .leading)
            Spacer()
            Text("\(standing.otLosses)")
                .frame(width: 40, alignment: .leading)
            Spacer()
            Text("\(standing.points)")
                .frame(width: 40, alignment: .leading)
            Spacer()
            Text("\(standing.goalFor)")
                .frame(width: 40, alignment: .leading)
            Spacer()
            Text("\(standing.goalAgainst)")
                .frame(width: 40, alignment: .leading)
        }
        .padding(10)
    }
}

struct NHLStandingsView_Preview: PreviewProvider {
    static var previews: some View {
        let standings = loadStandingsFromJSON()
        NHLStandingsView(standings: standings)
    }
    
    static func loadStandingsFromJSON() -> [Standing] {
        guard let url = Bundle.main.url(forResource: "StandingData", withExtension: "json") else {
            fatalError("Failed to locate JSON file in bundle.")
        }
        
    do {
        let data = try Data(contentsOf: url)
        let json = try JSONSerialization.jsonObject(with: data, options: [])
            
        if let dictionary = json as? [String: Any], let standingsArray = dictionary["standings"] as? [[String: Any]] {
            let standingsData = try JSONSerialization.data(withJSONObject: standingsArray, options: [])
            let standings = try JSONDecoder().decode([Standing].self, from: standingsData)
            return standings
        } else {
            fatalError("JSON format is invalid or does not contain expected data.")
            }
        } catch {
            fatalError("Failed to decode JSON: \(error)")
        }
    }
}
