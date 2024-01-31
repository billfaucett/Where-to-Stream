//
//  NHLBoxScoreView.swift
//  Where to Stream
//
//  Created by William Faucett on 1/31/24.
//

import SwiftUI

struct NHLBoxScoreView: View {
    let gameId: Int
    @ObservedObject var nhlViewControler = NHLViewController()
    @State var boxScoreData: GameDetails?
    
    var body: some View {
        VStack {
            HStack{
                Text(boxScoreData?.awayTeam.abbrev ?? "Please Work")
                Text(String(boxScoreData?.awayTeam.score ?? 0))
            }
            HStack{
                Text(boxScoreData?.homeTeam.abbrev ?? "Please Work")
                Text(String(boxScoreData?.homeTeam.score ?? 0))
            }
        }
        .onAppear {
            self.nhlViewControler.getBoxScore(gameId: gameId)
        }
        .onReceive(nhlViewControler.$boxScore){ newBoxScore in
            self.boxScoreData = newBoxScore
        }
    }
}

/*#Preview {
    NHLBoxScoreView()
}*/
