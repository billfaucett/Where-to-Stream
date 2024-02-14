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

struct NHLPLayerListView_Preview: PreviewProvider {
    static let player1 = Player(id: 1, firstName: Venue(venueDefault: "Bill", fr: "", es: ""), lastName: Venue(venueDefault: "Faucett", fr: "", es: ""), sweaterNumber: 11, headshot: "", teamAbbrev: "PHL", teamLogo: "", position: "RW", value: 50)
    static let player2 = Player(id: 2, firstName: Venue(venueDefault: "Cat", fr: "", es: ""), lastName: Venue(venueDefault: "Becker", fr: "", es: ""), sweaterNumber: 6, headshot: "", teamAbbrev: "NYR", teamLogo: "", position: "RW", value: 45)
    static let player3 = Player(id: 3, firstName: Venue(venueDefault: "Seth", fr: "", es: ""), lastName: Venue(venueDefault: "Levin", fr: "", es: ""), sweaterNumber: 6, headshot: "", teamAbbrev: "NYR", teamLogo: "", position: "RW", value: 40)
    static let player4 = Player(id: 4, firstName: Venue(venueDefault: "Drew", fr: "", es: ""), lastName: Venue(venueDefault: "Miller", fr: "", es: ""), sweaterNumber: 6, headshot: "", teamAbbrev: "NYR", teamLogo: "", position: "RW", value: 40)
    static let player5 = Player(id: 5, firstName: Venue(venueDefault: "Kevin", fr: "", es: ""), lastName: Venue(venueDefault: "Fine", fr: "", es: ""), sweaterNumber: 6, headshot: "", teamAbbrev: "PHL", teamLogo: "", position: "RW", value: 40)
    
    static var previews: some View {
        NHLPlayerListView(title: "Goals", players: [player1, player2, player3, player4, player5])
    }
}
