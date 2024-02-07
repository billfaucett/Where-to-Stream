//
//  SAResultListView.swift
//  Where to Stream
//
//  Created by William Faucett on 2/6/24.
//

import SwiftUI

struct SAResultListView: View {
    var resultsList: ProgramResults?
    var omdbResult: OMdbModelResult?
    var searchText: String?
    @State var plot: String = ""
    
    var body: some View {
        Section (header: Text("Search Results").bold().font(.headline)) {
            if let resultsList = resultsList?.result {
                List(resultsList.indices, id: \.self) { index in
                    if resultsList[index].title.contains(searchText!) && ((resultsList[index].streamingInfo?.us?.first) != nil) {
                        SATitleDetailsView(programDetails: resultsList[index], omdbDetails: omdbResult)
                    }
                }
            }
        }
    }
}

#Preview {
    SAResultListView()
}
