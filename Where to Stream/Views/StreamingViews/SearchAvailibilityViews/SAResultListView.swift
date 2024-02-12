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
        Section (header: Text("Search Results").bold().font(.title)) {
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
 
struct SAResultListView_Previews: PreviewProvider {
    static var title = ProgramDetails(firstAirYear: 2021, originalTitle: "Jenny and Billy's Adventures", creators: ["Bill","Jen"], imdbId: "tt2802850", tmdbId: 123, type: "Show", title: "Jenny and Billy's Adventures", lastAirYear: 2024, genres: [Genre(id: 1, name: "RomCom")], seasonCount: 4, episodeCount: 100, status: Status(statusText: "status", statusCode: 2), streamingInfo: StreamingInfo(us: [StreamingOption(audios: nil, subtitles: nil, streamingType: "Subscription", availableSince: 2021, service: "Netflix", link: nil)]), omdbResult: omdb)
    
    static var results = ProgramResults.init(result: [title])
    
    static var omdb = OMdbModelResult(Title: "Jenny and Billy's Adventures", Year: "2021", Rated: "R", Released: "2021", Runtime: "60", Genre: "RomCom", Director: "BF", Writer: "JB", Actors: "JB, BF", Plot: "You get it", Language: "en", Country: "us", Awards: "Engagement", Poster: "https://m.media-amazon.com/images/M/MV5BZjZjMzQ2ZmUtZWEyZC00NWJiLWFjM2UtMzhmYzZmZDcxMzllXkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_SX300.jpg", Ratings: [OMdbModelResult.Rating(Source: "Rating Source", Value: "100")], Metascore: "10", imdbRating: "10", imdbVotes: "100", imdbID: "tt2802850", totalSeasons: "10", Response: "Response")
    
    static var previews: some View {
        SAResultListView(resultsList: results, searchText: "Jenny and Billy's Adventures")
    }
}

