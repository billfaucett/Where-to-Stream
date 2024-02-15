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
                    VStack {
                        GeometryReader { proxy in
                            AsyncImage(url: URL(string: player.headshot)) { phase in
                                switch phase {
                                case .empty:
                                    ProgressView()
                                case .success(let image):
                                    image
                                        .resizable()
                                        .scaledToFit()
                                        .frame(width: 40, height: 40)
                                case .failure:
                                    Image(systemName: "exclamationmark.triange")
                                        .foregroundColor(.red)
                                default:
                                    EmptyView()
                                }
                            }
                        }
                        Spacer()
                        HStack{
                            Text("\(player.firstName.venueDefault) \(player.lastName.venueDefault)")
                                .font(.subheadline)
                            SVGImageView(url: player.teamLogo)
                        }
                    }
                    Spacer()
                    Spacer()
                    Text(String(formatStatValue(statType: title, value: player.value)))
                        .font(.subheadline)
                        .bold()
                }
            }
        }
        Divider()
        Spacer()
    }
}

struct SVGImageView: View{
    var url: String
    @State private var image: Image?
    
    var body: some View {
        Group {
            if let image = image {
                image
                    .resizable()
                    .scaledToFit()
                    .frame(width:30, height: 30)
            } else {
                ProgressView()
            }
        }
        .onAppear {
            ModelHelpers.modelHelper.loadSVGImage(url: url) { image in
                self.image = image
            }
        }
    }
}

func formatStatValue (statType: String, value: Double) -> String {
    switch statType {
    case "NHL Goals Against Avg Leaders":
        return String(format: "%.2f", value)
    case "NHL Save % Leaders":
        return String(format: "%.3f", value)
    default:
        return String(Int(value))
    }
}

struct NHLPLayerListView_Preview: PreviewProvider {
    static let player1 = Player(id: 1, firstName: Venue(venueDefault: "Bill", fr: "", es: ""), lastName: Venue(venueDefault: "Faucett", fr: "", es: ""), sweaterNumber: 11, headshot: "https://assets.nhle.com/mugs/nhl/20232024/VGK/8478499.png", teamAbbrev: "PHL", teamLogo: "https://assets.nhle.com/logos/nhl/svg/PHI_light.svg", position: "RW", value: 50)
    static let player2 = Player(id: 2, firstName: Venue(venueDefault: "Cat", fr: "", es: ""), lastName: Venue(venueDefault: "Becker", fr: "", es: ""), sweaterNumber: 6, headshot: "https://assets.nhle.com/mugs/nhl/20232024/VGK/8478499.png", teamAbbrev: "NYR", teamLogo: "https://assets.nhle.com/logos/nhl/svg/NYR_light.svg", position: "RW", value: 45)
    static let player3 = Player(id: 3, firstName: Venue(venueDefault: "Seth", fr: "", es: ""), lastName: Venue(venueDefault: "Levin", fr: "", es: "https://assets.nhle.com/logos/nhl/svg/NJD_light.svg"), sweaterNumber: 6, headshot: "https://assets.nhle.com/mugs/nhl/20232024/VGK/8478499.png", teamAbbrev: "NJD", teamLogo: "", position: "RW", value: 40)
    static let player4 = Player(id: 4, firstName: Venue(venueDefault: "Drew", fr: "", es: ""), lastName: Venue(venueDefault: "Miller", fr: "", es: "https://assets.nhle.com/logos/nhl/svg/NYI_light.svg"), sweaterNumber: 6, headshot: "https://assets.nhle.com/mugs/nhl/20232024/VGK/8478499.png", teamAbbrev: "NYI", teamLogo: "", position: "RW", value: 40)
    static let player5 = Player(id: 5, firstName: Venue(venueDefault: "Kevin", fr: "", es: ""), lastName: Venue(venueDefault: "Fine", fr: "", es: "https://assets.nhle.com/logos/nhl/svg/PHI_light.svg"), sweaterNumber: 6, headshot: "https://assets.nhle.com/mugs/nhl/20232024/VGK/8478499.png", teamAbbrev: "PHL", teamLogo: "", position: "RW", value: 40)
    
    static var previews: some View {
        NHLPlayerListView(title: "Goals", players: [player1, player2, player3, player4, player5])
    }
}
