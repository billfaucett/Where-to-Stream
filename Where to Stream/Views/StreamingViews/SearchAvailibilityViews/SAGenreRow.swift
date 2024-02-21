//
//  SAGenreRow.swift
//  Where to Stream
//
//  Created by William Faucett on 2/21/24.
//

import SwiftUI

struct SAGenreRow: View {
    let genre: Genre
    var body: some View {
        Text(genre.name)
    }
}

struct SAGenreRow_Preview: PreviewProvider {
    static var genre = Genre(id: 1, name: "RomCom")
    static var previews: some View {
        SAGenreRow(genre: genre)
    }
}
