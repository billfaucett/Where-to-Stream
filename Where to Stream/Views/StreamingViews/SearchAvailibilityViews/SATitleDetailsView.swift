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
        if let omdbDetails = omdbDetails, !omdbDetails.Poster.isEmpty, !omdbDetails.Plot.isEmpty {
            NavigationView {
                Section(header: Text("Program Details")) {
                    VStack{
                        HStack{
                            Text(programDetails?.title ?? "title")
                                .font(.title2)
                                .bold()
                            Spacer()
                            SAImageView(urlString: omdbDetails.Poster)
                        }
                        VStack{
                            Divider()
                            HStack {
                                VStack{
                                    Text(programDetails?.type.capitalized ?? "Service")
                                    Text(programDetails?.genres.first?.name ?? "genre")
                                }
                                Spacer()
                                VStack {
                                    Text(programDetails?.streamingInfo?.us?.first?.capitalizedServiceName ?? "service")
                                    Text(programDetails?.streamingInfo?.us?.first?.capitalizedStreamingType ?? "type")
                                }
                            }
                            VStack {
                                Divider()
                                Text("Cast: \(omdbDetails.Actors )")
                                    .fixedSize(horizontal: false, vertical: /*@START_MENU_TOKEN@*/true/*@END_MENU_TOKEN@*/)
                                    .font(.subheadline)
                                Divider()
                                Text(omdbDetails.Plot)
                                    .fixedSize(horizontal: false, vertical: true)
                                    .font(.subheadline)
                                Divider()
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
