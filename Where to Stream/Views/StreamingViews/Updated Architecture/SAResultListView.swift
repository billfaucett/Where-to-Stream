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
    
    var body: some View {
        Section (header: Text("Results")) {
            if let resultsList = resultsList?.result {
                List(resultsList.indices, id: \.self) { index in
                    if resultsList[index].title.contains(searchText!) && ((resultsList[index].streamingInfo?.us?.first) != nil) {
                        HStack {
                            Text("\(resultsList[index].title) - \(resultsList[index].type)")
                            Spacer()
                            VStack {
                                Text(resultsList[index].streamingInfo?.us?.first?.capitalizedServiceName ?? "Service Name")
                                Text(resultsList[index].streamingInfo?.us?.first?.capitalizedStreamingType ?? "Service Type")
                            }
                        }
                        VStack {
                            if resultsList[index].imdbId == omdbResult?.imdbID {
                                Text("Plot: \(omdbResult?.Plot.description ?? "")")
                            }
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
