//
//  SAResultListView.swift
//  Where to Stream
//
//  Created by William Faucett on 2/6/24.
//

import SwiftUI

struct SAResultListView: View {
    @ObservedObject var controller = SASearchViewController()
    var resultsList: ProgramResults?
    var omdbResult: OMdbModelResult?
    var searchText: String?
    
    var body: some View {
        Section (header: Text("Search Results").bold().font(.headline)) {
            if let resultsList = resultsList?.result {
                List(resultsList.indices, id: \.self) { index in
                    if resultsList[index].title.contains(searchText!) && ((resultsList[index].streamingInfo?.us?.first) != nil) {
                        if resultsList[index].omdbResult?.Poster != nil  {
                            SATitleDetailsView(programDetails: resultsList[index], omdbDetails: resultsList[index].omdbResult)
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    SAResultListView()
}
