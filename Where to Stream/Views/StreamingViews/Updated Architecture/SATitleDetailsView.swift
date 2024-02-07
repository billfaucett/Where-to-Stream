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
                        if omdbDetails != nil {
                            SAImageView(urlString: omdbDetails!.Poster)
                        }
                    }
                    VStack{
                        HStack {
                            VStack{
                                Text(programDetails?.type.capitalized ?? "Service")
                                Text(programDetails?.genres.first?.name ?? "genre")
                            }
                            VStack {
                                Text(programDetails?.streamingInfo?.us?.first?.capitalizedServiceName ?? "service")
                                Text(programDetails?.streamingInfo?.us?.first?.capitalizedStreamingType ?? "type")
                            }
                        }
                        if omdbDetails != nil {
                            Text(omdbDetails!.Plot)
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
