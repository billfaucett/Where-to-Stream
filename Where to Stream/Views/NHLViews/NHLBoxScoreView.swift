//
//  NHLBoxScoreView.swift
//  Where to Stream
//
//  Created by William Faucett on 1/31/24.
//

import SwiftUI

struct NHLBoxScoreView: View {
    @ObservedObject var nhlViewControler = NHLViewController()
    @State private var boxScore: GameDetails?
    let gameId: Int
    
    var body: some View {
        VStack {
            HStack{
                Text(boxScore?.awayTeam.abbrev ?? "error")
                Text(String(boxScore?.awayTeam.score ?? 0))
            }
            HStack{
                Text(boxScore?.homeTeam.abbrev ?? "error")
                Text(String(boxScore?.homeTeam.score ?? 0))
            }
        }
        .onAppear {
            self.nhlViewControler.getBoxScore(gameId: gameId)
            self.boxScore = nhlViewControler.boxScore
        }
    }
}

/*#Preview {
    NHLBoxScoreView()
}*/
