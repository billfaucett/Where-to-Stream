//
//  NHLLeaderRow.swift
//  Where to Stream
//
//  Created by William Faucett on 2/15/24.
//

import SwiftUI

struct NHLLeaderRow: View {
    let player : Player
    let stat: String
    @State private var image: UIImage?
    
    var body: some View {
        HStack {
            if let image = image {
                Image(uiImage: image)
                    .resizable()
                    .scaledToFit()
                    .frame(width: 40, height: 40)
            }
            Text("\(player.firstName.venueDefault) \(player.lastName.venueDefault)")
            Spacer()
            SVGImageView(url: player.teamLogo)
            
            Spacer()
            
            Divider()
            Text(formatStatValue(statType: stat, value: player.value))
            Divider()
        }
        .onAppear() {
            ModelHelpers.modelHelper.loadImage(urlString: player.headshot) { image in
                self.image = image
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
}

struct NHLLeaderRow_Preview: PreviewProvider {
    static let player = Player(id: 1, firstName: Venue(venueDefault: "Bill", fr: "", es: ""), lastName: Venue(venueDefault: "Faucett", fr: "", es: ""), sweaterNumber: 11, headshot: "https://assets.nhle.com/mugs/nhl/20232024/VGK/8478499.png", teamAbbrev: "PHL", teamLogo: "https://assets.nhle.com/logos/nhl/svg/PHI_light.svg", position: "RW", value: 50)
    
    static var previews: some View {
        NHLLeaderRow(player: player, stat: "Goals")
    }
}
