//
//  NHLLeadersView.swift
//  Where to Stream
//
//  Created by William Faucett on 2/5/24.
//

import SwiftUI
import SVGKit
import URLImage

struct NHLLeadersView: View {
    let pointsLeaders: [Player]
    let goalsLeaders: [Player]
    let assistsLeaders: [Player]
    
    var body: some View {
        
        Spacer()
        
        VStack {
            Text("NHL Scoring Leaders")
                .bold()
            List(pointsLeaders) { player in
                HStack {
                    Text(player.lastName.venueDefault)
                        .font(.subheadline)
                    Text(player.teamAbbrev)
                        .font(.subheadline)
                    Text(String(player.value))
                        .font(.subheadline)
                }
            }
        }
            
        VStack {
            Text("NHL Goals Leaders")
                .bold()
            List(goalsLeaders) { player in
                HStack {
                    Text(player.lastName.venueDefault)
                        .font(.subheadline)
                    Text(player.teamAbbrev)
                        .font(.subheadline)
                    Text(String(player.value))
                    .font(.subheadline)
                }
            }
        }
            
        VStack {
            Text("NHL Assist Leaders")
                .bold()
            List(assistsLeaders) { player in
                HStack {
                    Text(player.lastName.venueDefault)
                        .font(.subheadline)
                    Text(player.teamAbbrev)
                        .font(.subheadline)
                    Text(String(player.value))
                        .font(.subheadline)
                }
            }
        }
    }
}

#Preview {
    NHLLeadersView(pointsLeaders: [], goalsLeaders: [], assistsLeaders: [])
}
