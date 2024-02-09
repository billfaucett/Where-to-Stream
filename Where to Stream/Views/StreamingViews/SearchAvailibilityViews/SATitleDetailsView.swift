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
    var isLoaded = false
    
    var body: some View {
        if let programs = programDetails {
            if let omdbDetails = programDetails?.omdbResult, !omdbDetails.Poster.isEmpty, !omdbDetails.Plot.isEmpty {
                NavigationView {
                    Section(header: Text("Program Details")) {
                        VStack{
                            HStack{
                                Text(programs.title )
                                    .font(.title2)
                                    .bold()
                                Spacer()
                                if let poster = programs.omdbResult?.Poster{
                                    SAImageView(urlString: poster)
                                }
                            }
                            VStack{
                                Divider()
                                HStack {
                                    VStack{
                                        Text(programs.type.capitalized)
                                        Text(programs.genres.first?.name ?? "Genre")
                                    }
                                    Spacer()
                                    VStack {
                                        Text(programs.streamingInfo?.us?.first?.capitalizedServiceName ?? "service")
                                        Text(programs.streamingInfo?.us?.first?.capitalizedStreamingType ?? "type")
                                    }
                                }
                                VStack {
                                    Divider()
                                    Text("Cast: \(programs.omdbResult?.Actors ?? "")")
                                        .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                        .font(.subheadline)
                                    Divider()
                                    Text(programs.omdbResult?.Plot ?? "")
                                        .fixedSize(horizontal: false, vertical: true)
                                        .font(.subheadline)
                                    Divider()
                                }
                            }
                        }
                    }
                }
            }
        } else {
            Text("Loading")
        }
    }
}

struct SATitleDetailsView_Previews: PreviewProvider {
    static var previews: some View {
        SATitleDetailsView()
    }
}
