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
                                        .frame(width: 100, alignment: .leading)
                                    Spacer()
                                    Text("W")
                                        .frame(width: 50, alignment: .leading)
                                    Spacer()
                                    Text("L")
                                        .frame(width: 50, alignment: .leading)
                                    Spacer()
                                    Text("OTL")
                                        .frame(width: 50, alignment: .leading)
                                    Spacer()
                                    Text("Pts")
                                        .frame(width: 50, alignment: .leading)
                                    Text("GF")
                                        .frame(width: 50, alignment: .leading)
                                    Spacer()
                                    Text("GA")
                                        .frame(width: 50, alignment: .leading)
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
                .frame(width: 100, alignment: .leading)
            Spacer()
            Text("\(standing.wins)")
                .frame(width: 50, alignment: .leading)
            Spacer()
            Text("\(standing.losses)")
                .frame(width: 50, alignment: .leading)
            Spacer()
            Text("\(standing.otLosses)")
                .frame(width: 50, alignment: .leading)
            Spacer()
            Text("\(standing.points)")
                .frame(width: 50, alignment: .leading)
            Spacer()
            Text("\(standing.goalFor)")
                .frame(width: 50, alignment: .leading)
            Spacer()
            Text("\(standing.goalAgainst)")
                .frame(width: 50, alignment: .leading)
        }
        .padding(10)
    }
}
