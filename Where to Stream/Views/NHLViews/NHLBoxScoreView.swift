//
//  NHLBoxScoreView.swift
//  Where to Stream
//
//  Created by William Faucett on 1/31/24.
//

import SwiftUI

struct NHLBoxScoreView: View {
    @ObservedObject var nhlViewControler = NHLViewController()
    let gameId: Int
    
    var body: some View {
        VStack {
            Text("Game Id: \(String(gameId))")
                .onAppear {
                    self.nhlViewControler.getBoxScore(gameId: gameId)
                }
        }
    }
}

/*#Preview {
    NHLBoxScoreView()
}*/
