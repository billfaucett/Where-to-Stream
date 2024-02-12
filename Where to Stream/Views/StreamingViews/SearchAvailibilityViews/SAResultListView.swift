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
                        SATitleDetailsView(programDetails: resultsList[index], omdbDetails: resultsList[index].omdbResult)
                    }
                }
            }
        }
    }
}

#Preview {
    /*static let myResults = ProgramResults(result: ProgramDetails(firstAirYear: 2021, originalTitle: "Jenny and Billy's Adventures", creators: nil, imdbId: "tt2802850", tmdbId: 123, type: "RomCom", title: "Jenny and Billy's Adventures", lastAirYear: 2024, genres: [Genre](), seasonCount: 4, episodeCount: 100, status: Status(statusText: "Active", statusCode: 69), streamingInfo: StreamingInfo(us: StreamingOption(audios: nil, subtitles: nil, streamingType: "Subscription", availableSince: 2021, service: "Netflix", link: nil))))*/
    
    SAResultListView()
}
