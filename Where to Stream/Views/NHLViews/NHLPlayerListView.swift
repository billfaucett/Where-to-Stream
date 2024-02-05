//
//  NHLPlayerListView.swift
//  Where to Stream
//
//  Created by William Faucett on 2/5/24.
//

import SwiftUI
import UIKit
import SVGKit

struct NHLPlayerListView: View {
    let title: String
    let players: [Player]
    
    var body: some View {
        VStack {
            Text(title)
                .bold()
            List(players) { player in
                HStack {
                    Text("\(player.firstName.venueDefault) \(player.lastName.venueDefault)")
                        .font(.subheadline)
                    Text(player.teamAbbrev)
                        .font(.subheadline)
                    Spacer()
                    Text(String(player.value))
                        .font(.subheadline)
                        .bold()
                }
            }
        }
        Divider()
        Spacer()
    }
}

#Preview {
    NHLPlayerListView(title: "Title", players: [])
}
