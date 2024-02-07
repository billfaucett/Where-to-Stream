//
//  SATitleDetailsView.swift
//  Where to Stream
//
//  Created by William Faucett on 2/6/24.
//

import SwiftUI

struct SATitleDetailsView: View {
    //@ObservedObject var saViewController : SASearchViewController
    var programDetails: ProgramDetails?
    var omdbDetails: OMdbModelResult?
    
    var body: some View {
        NavigationView {
            Section(header: Text("Program Details")) {
                VStack{
                    HStack{
                        Text(programDetails?.title ?? "title")
                            .font(.title2)
                            .bold()
                        Spacer()
                        if (omdbDetails != nil && omdbDetails?.imdbID == programDetails?.imdbId){
                            SAImageView(urlString: omdbDetails!.Poster)
                        }
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
                            if (omdbDetails != nil && omdbDetails?.imdbID == programDetails?.imdbId) {
                                Divider()
                                Text(omdbDetails!.Plot)
                            }
                        }
                    }
                }
            }
        }
    }
}

#Preview {
    SATitleDetailsView()
}
