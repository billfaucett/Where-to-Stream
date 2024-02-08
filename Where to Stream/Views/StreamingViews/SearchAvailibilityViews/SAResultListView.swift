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
    @State var omdbResult: OMdbModelResult?
    @State var updatedOmdbResult: OMdbModelResult?
    @State var updatedOmdb = false
    var searchText: String?
    
    func updateOMDBData(title: String) {
        controller.getOmdbDetails(title: title)
        updatedOmdbResult = controller.omdbResults
    }
    
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
