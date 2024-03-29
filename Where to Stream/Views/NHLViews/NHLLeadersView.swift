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
        VStack {
            NHLPlayerListView(title: "NHL Points Leaders", players: pointsLeaders)
            NHLPlayerListView(title: "NHL Goals Leaders", players: goalsLeaders)
            NHLPlayerListView(title: "NHL Assists Leaders", players: assistsLeaders)
        }
    }
}

struct NHLLeadersView_Preview: PreviewProvider {
    static var previews: some View {
        NHLLeadersView(pointsLeaders: PreviewData.points, goalsLeaders:PreviewData.goalscorers, assistsLeaders: PreviewData.assists)
    }
}
