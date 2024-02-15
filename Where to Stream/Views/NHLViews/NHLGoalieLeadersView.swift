//
//  NHLGoalieLeadersView.swift
//  Where to Stream
//
//  Created by William Faucett on 2/14/24.
//

import SwiftUI
import SVGKit
import URLImage

struct NHLGoalieLeadersView: View {
    let goalsAgainst: [Player]
    let wins: [Player]
    let shutouts: [Player]
    let savePercentage: [Player]
    
    var body: some View {
        VStack {
            NHLPlayerListView(title: "NHL Goals Against Avg Leaders", players: goalsAgainst)
            NHLPlayerListView(title: "NHL Wins Leaders", players: wins)
            NHLPlayerListView(title: "NHL Shutouts Leaders", players: shutouts)
            NHLPlayerListView(title: "NHL Save % Leaders", players: savePercentage)
        }
    }
}

struct NHLGoalieLeadersView_Preview: PreviewProvider {
    static var previews: some View {
        NHLGoalieLeadersView(goalsAgainst: PreviewData.gaa, wins: PreviewData.wins, shutouts: PreviewData.shutouts, savePercentage: PreviewData.svPctg)
    }
}
