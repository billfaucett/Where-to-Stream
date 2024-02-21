//
//  SATitleDetailsView.swift
//  Where to Stream
//
//  Created by William Faucett on 2/6/24.
//

import SwiftUI

struct SATitleDetailsView: View {
    var programDetails: ProgramDetails?
    var omdbDetails: OMdbModelResult?
    
    var body: some View {
        if let program = programDetails{
            NavigationView {
                Section() {
                    VStack{
                        HStack{
                            VStack{
                                Text(program.title )
                                    .font(.title2)
                                    .bold()
                                Divider()
                                Text(program.type.capitalized)
                                    .font(.subheadline)
                            }
                            Spacer()
                            if let poster = program.omdbResult?.Poster{
                                SAImageView(urlString: poster)
                            }
                        }
                        VStack{
                            Divider()
                            VStack{
                                ForEach(program.genres.indices, id: \.self) { index in
                                    SAGenreRow(genre: program.genres[index])
                                }
                            }
                            Divider()
                            VStack {
                                if let streamingOptions = program.streamingInfo?.us {
                                    ForEach(streamingOptions.indices, id: \.self) { index in
                                        SAStreamingInfoRow(streamingRow: streamingOptions[index])
                                    }
                                } else {
                                    Text("No streaming options found.")
                                }
                            }
                            VStack {
                                Divider()
                                Text("Cast: \(program.omdbResult?.Actors ?? "")")
                                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                    .font(.subheadline)
                                Divider()
                                Text(program.omdbResult?.Plot ?? "")
                                    .fixedSize(horizontal: false, vertical: true)
                                .font(.subheadline)
                                Divider()
                            }
                        }
                    }
                }
            }
        }
    }
}

struct SATitleDetailsView_Previews: PreviewProvider {
    static let programDetails = ProgramDetails(firstAirYear: 2024, originalTitle: "Billy Loves Jenny", creators: ["BF","JB"], imdbId: "tt2802850", tmdbId: 222, type: "Series", title: "Billy and Jenny Get Down", lastAirYear: 2024, genres: [Genre(id: 1, name: "Romance"), Genre(id: 2, name: "Comedy")], seasonCount: 1, episodeCount: 1, status: Status(statusText: "Done", statusCode: 1), streamingInfo: StreamingInfo(us: [StreamingOption(audios: nil, subtitles: nil, streamingType: "Subscription", availableSince: 2021, service: "Netflix", link: nil)]), omdbResult: omdbDetails)
    
    static let omdbDetails = OMdbModelResult(Title: "Billy and Jenny Get Down", Year: "2024", Rated: "XXX", Released: "2024", Runtime: "120", Genre: "Porn", Director: "BF", Writer: "JB", Actors: "Bf, JB", Plot: "Jenny and Billy meet and get busy", Language: "en", Country: "us", Awards: "", Poster: "https://m.media-amazon.com/images/M/MV5BZjZjMzQ2ZmUtZWEyZC00NWJiLWFjM2UtMzhmYzZmZDcxMzllXkEyXkFqcGdeQXVyNTA4NzY1MzY@._V1_SX300.jpg", Ratings: [OMdbModelResult.Rating](), Metascore: "10", imdbRating: "10", imdbVotes: "100", imdbID: "tt2802850", totalSeasons: nil, Response: "success")
    
    static var previews: some View {
        SATitleDetailsView(programDetails: programDetails, omdbDetails: omdbDetails)
    }
}
