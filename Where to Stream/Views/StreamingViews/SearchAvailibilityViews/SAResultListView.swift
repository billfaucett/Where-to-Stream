//
//  SAResultListView.swift
//  Where to Stream
//
//  Created by William Faucett on 2/6/24.
//

import SwiftUI

struct SAResultListView: View {
    @ObservedObject var saViewController = SASearchViewController()
    @State var isLoading = false
    var resultsList: ProgramResults?
    var omdbResult: OMdbModelResult?
    var searchText: String?
    
    var body: some View {
        Section (header: Text("Search Results").bold().font(.title)) {
            if let resultsList = resultsList?.result, let searchText = searchText {
                List(resultsList.indices, id: \.self) { index in
                    if resultsList[index].title.contains(searchText) && ((resultsList[index].streamingInfo?.us?.first) != nil) {
                        SATitleDetailsView(programDetails: resultsList[index], omdbDetails: resultsList[index].omdbResult)
                    }
                }
            } else {
                if let results = saViewController.results {
                    if isLoading {
                        ProgressView().progressViewStyle(CircularProgressViewStyle()) .id(UUID())
                    } else {
                        List (results.result.indices, id: \.self) { index in
                            if results.result[index].title.contains(searchText!) && ((results.result[index].streamingInfo?.us?.first) != nil) {
                                SATitleDetailsView(programDetails: results.result[index])
                            }
                        }
                    }
                }
            }
        }
        .onAppear() {
            if resultsList == nil && searchText != nil {
                isLoading = true
                searchStreamingAPI(title: searchText!)
            }
        }
        .onReceive(saViewController.$results) { results in
            if results != nil {
                isLoading = false
            }
        }
    }
    
    func searchStreamingAPI (title: String) {
        DispatchQueue.main.async {
            saViewController.searchByTitle(title: title)
        }
    }
}
 
struct SAResultListView_Previews: PreviewProvider {
    static var title = ProgramDetails(firstAirYear: 2021, originalTitle: "Jenny and Billy's Adventures", creators: ["Bill","Jen"], imdbId: "tt2802850", tmdbId: 123, type: "Series", title: "Jenny and Billy's Adventures", lastAirYear: 2024, genres: [Genre(id: 1, name: "RomCom")], seasonCount: 4, episodeCount: 100, status: Status(statusText: "status", statusCode: 2), streamingInfo: StreamingInfo(us: [StreamingOption(audios: nil, subtitles: nil, streamingType: "Subscription", availableSince: 2021, service: "Netflix", link: nil)]), omdbResult: omdb)
    
    static var results = ProgramResults.init(result: [title])
    
    static var omdb = OMdbModelResult(Title: "Jenny and Billy's Adventures", Year: "2021", Rated: "R", Released: "2021", Runtime: "60", Genre: "RomCom", Director: "BF", Writer: "JB", Actors: "JB, BF", Plot: "You get it, they met, played mini golf, enjoyed countless cocktails, cuddled pets, fell in love, and are getting married", Language: "en", Country: "us", Awards: "Engagement", Poster: "https://m.media-amazon.com/images/M/MV5BZjZjMzQ2ZmUtZWEyZC00NWJiLWFjM2UtMzhmYzZmZDcxMzllXkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_SX300.jpg", Ratings: [OMdbModelResult.Rating(Source: "Rating Source", Value: "100")], Metascore: "10", imdbRating: "10", imdbVotes: "100", imdbID: "tt2802850", totalSeasons: "10", Response: "Response")
    
    static var previews: some View {
        SAResultListView(resultsList: results, searchText: "Jenny and Billy's Adventures")
    }
}

