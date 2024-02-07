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
        Section (header: Text("Results")) {
            if let resultsList = resultsList?.result {
                List(resultsList.indices, id: \.self) { index in
                    if resultsList[index].title.contains(searchText!) && ((resultsList[index].streamingInfo?.us?.first) != nil) {
                        VStack {
                            HStack{
                                Text(resultsList[index].title)
                                    .bold()
                                    .font(.title2)
                                Spacer()
                                if resultsList[index].imdbId == omdbResult?.imdbID {
                                    SAImageView(urlString: omdbResult!.Poster)
                                }
                            }
                        }
                        HStack {
                            VStack {
                                Text(resultsList[index].type.capitalized)
                                Text(resultsList[index].genres.first?.name ?? "Genre")
                            }
                            Spacer()
                            VStack {
                                Text(resultsList[index].streamingInfo?.us?.first?.capitalizedServiceName ?? "Service Name")
                                Text(resultsList[index].streamingInfo?.us?.first?.capitalizedStreamingType ?? "Service Type")
                            }
                            
                        }
                        VStack {
                            if resultsList[index].imdbId == omdbResult?.imdbID {
                                Text(omdbResult?.Plot.description ?? "")
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
